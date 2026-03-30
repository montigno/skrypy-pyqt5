##########################################################################
# mriWorks - Copyright (C) IRMAGE/INSERM, 2020
# Distributed under the terms of the CeCILL-B license, as published by
# the CEA-CNRS-INRIA. Refer to the LICENSE file or to
# https://cecill.info/licences/Licence_CeCILL_V2-en.html
# for details.
##########################################################################

import ast
import os
import time


class getlistModules3:

    def __init__(self):

        modules_path = os.path.dirname(__file__)
        modules_path, _ = os.path.split(modules_path)
        modules_path = os.path.join(modules_path, 'modules')
        self.listBlocks, self.list_tree, self.list_icons = self.build_class_dict(modules_path)

    def get_annotation(self, annotation):
        if annotation is None:
            return None
        try:
            return ast.unparse(annotation)
        except Exception:
            return None


    def get_default(self, value):
        res = None
        if value is None:
            res =  None
        try:
            res = ast.unparse(value)
            res = " ".join(res.split())
        except Exception:
            res = None
        # print("get_default=", res)
        return res


    def extract_function_signature(self, func_node):
        args = func_node.args

        pos_args = args.args
        defaults = args.defaults
        default_values = [None] * (len(pos_args) - len(defaults)) + defaults

        list_enters, list_defaults, list_type = [], [], []

        for arg, default in zip(pos_args, default_values):
            if arg.arg == "self":
                continue
            list_enters.append(arg.arg)
            try:
                list_defaults.append(eval(self.get_default(default)))
            except Exception:
                list_defaults.append(self.get_default(default))

        # 🔹 *args
        if args.vararg:
            list_enters.append(args.vararg.arg)
            list_defaults.append(None)

        # 🔹 keyword-only args
        for arg, default in zip(args.kwonlyargs, args.kw_defaults):
            list_enters.append(arg.arg)
            list_defaults.append(self.get_default(default))

        # 🔹 **kwargs
        # if args.kwarg:
        #     print(args.kwarg.arg)
        #     list_enters.append(args.kwarg.arg)
        #     list_defaults.append(None)

        # list_type = self.get_annotation(func_node.returns)
        list_type = self.convert_type(func_node.returns)

        return list_enters, list_defaults, list_type


    def extract_class_info(self, file_path):
        with open(file_path, "r", encoding="utf-8") as f:
            tree = ast.parse(f.read(), filename=file_path)

        cat = os.path.basename(os.path.dirname(file_path))
        filePy = os.path.basename(file_path)
        filePy = filePy.replace('.py', '')
        
        # print("extract=", cat, filePy)

        classes = {}
        categories = {}
        list_class = []

        # print(cat, '.', filePy)
        for node in ast.walk(tree):
            if isinstance(node, ast.ClassDef):
                class_info = [f"{cat}.{filePy}"]
                # print('class_info=', class_info)
                # list_py = {}
                outs_list, outs_type = [], []
                # print(' ' * 4, node.name)
                list_ports = []
                for body_item in node.body:
                    if isinstance(body_item, ast.FunctionDef):
                        # print("body_item=", class_info, node.name, body_item.name)

                        if body_item.name == "__init__":
                            res = self.extract_function_signature(body_item)
                            list_ports.append(res[0])
                            list_ports.append(res[1])
                        else:
                            outs_list.append(body_item.name)
                            res = self.extract_function_signature(body_item)
                            outs_type.append(res[2])
                list_ports.append(outs_list)
                list_ports.append(outs_type)
                class_info.append(tuple(list_ports))
                classes[node.name] = class_info

                list_class.append(node.name)
        categories[filePy] = sorted(list_class)
        # categories.update(list_py)

        # print(classes, categories)
        # print("categories=", categories)

        return classes, categories


    def build_class_dict(self, folder_path):
        result = {}
        list_cat = {}
        list_icons = {}
        print(os.walk(folder_path))
        for root, dirs, files in os.walk(folder_path):
            result2 = {}
            rec = False
            dirs.sort()
            files.sort()
            for file in files:
                if file.endswith(".py") and file != '__init__.py':
                    # print("file=", root, file)
                    rep = os.path.basename(root)
                    path = os.path.join(root, file)
                    try:
                        res = self.extract_class_info(path)
                        result.update(res[0])
                        result2.update(res[1])
                        rec = True
                    except Exception as e:
                        print(f"Erreur dans {path}: {e}")
            if rec:
                list_cat[rep] = result2
                list_cat = dict(sorted(list_cat.items()))

                # print('rep =', rep, result2)
                if os.path.exists(os.path.join(root, rep + '.png')):
                    icon = os.path.join(root, rep + '.png')
                else:
                    icon = os.path.join(root, '..', '..', '..', 'ressources', 'Python.png')
                list_icons[rep] = icon

        return result, list_cat, list_icons

    def convert_type(self, anno):
        res = ''
        t = None
        try:
            t =  ast.unparse(anno)
        except Exception:
            return None

        if 'list[list[' in t:
            res = 'array_'
            t= t[10:-2]

        elif 'list[' in t:
            res = 'list_'
            t = t[5:-1]
        
        if t == 'None':
            t = 'path'
        
        return res + t

    def getListBlocks(self):
        return self.listBlocks
    
    def listCat(self):
        return self.list_tree
    
    def listIcons(self):
        return self.list_icons
