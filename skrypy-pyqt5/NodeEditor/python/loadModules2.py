##########################################################################
# mriWorks - Copyright (C) IRMAGE/INSERM, 2020
# Distributed under the terms of the CeCILL-B license, as published by
# the CEA-CNRS-INRIA. Refer to the LICENSE file or to
# https://cecill.info/licences/Licence_CeCILL_V2-en.html
# for details.
##########################################################################

import typing_inspect
import importlib
import inspect
import list_imports
import os


class getlistModules2:

    def __init__(self):

        # reps = os.path.dirname(__file__)
        # reps, _ = os.path.split(reps)
        # rep = os.path.join(reps, 'modules')
        # lstmod = os.listdir(rep)
        # lstmod.sort()

        modules_path = os.path.dirname(__file__)
        modules_path, _ = os.path.split(modules_path)
        modules_path = os.path.join(modules_path, 'modules')
        list_cat = os.listdir(modules_path)
        list_cat.remove('__init__.py')
        list_cat.remove('__pycache__')
        list_cat.sort()

        print(modules_path)
        print(list_cat)
        
        # self.category = {}
        # self.config = []
        # self.objectsInModul = []
        # self.listLib = []
        # self.listBlocks = {}
        # self.list_tree = {}

        for cat in list_cat:
            
            full_path = os.path.join(modules_path, cat)
            
            if os.path.exists(os.path.join(modules_path, cat + '.png')):
                self.icon = os.path.join(modules_path, cat + '.png')
            else:
                self.icon = os.path.join(modules_path, '..', '..', '..', 'ressources', 'Python.png')
            
            for name in os.listdir(full_path):
                if name.endswith(".py"):
                    filePy = 'NodeEditor.modules.' + \
                            cat + \
                            '.' + \
                            str(name.replace('.py', ''))
                    print(filePy)
            #         # filePyAbsolute = os.path.join(modules, name)
            #         # first_line = ''
            #         # with open(filePyAbsolute) as f:
            #         #     first_line = f.readline()
            #         # if "skrypy_modules" in first_line:
            #         #     print(first_line, name)
            #         imp = importlib.import_module(filePy)
            #         importlib.reload(imp)
            #         self.objectsInModul = list_imports.get(os.path.join(modules, name))
            #         listClass, listCategory = [], []
            #         for nameClass, obj in inspect.getmembers(imp):
            #             # print(nameClass," : ",inspect.getcomments(obj))
            #             if inspect.isclass(obj):
            #                 try:
            #                     src = inspect.getsource(obj)
            #                     for lb in self.objectsInModul:
            #                         if lb:
            #                             if ('NodeEditor' not in lb and 'PyQt5' not in lb):
            #                                 try:
            #                                     lb = lb[0:lb.index(".")]
            #                                 except Exception:
            #                                     pass
            #                                 self.listLib.append(lb)
            #                     listOrderClass = self.findClassOrder(src)
            #
            #                     if obj.__module__.find('modules.sources') == -1:
            #                         listArgs = inspect.getfullargspec(obj)
            #                         listArgs[0].remove('self')
            #                         # print('before :', listArgs[3])
            #                         result = None
            #                         if listArgs[3]:
            #                             result = []
            #                             lst_tmp = list(listArgs[3])
            #                             for el in lst_tmp:
            #                                 try:
            #                                     if 'enumerate' in el:
            #                                         # result.append(el.replace(" ", ""))
            #                                         result.append(el.strip())
            #                                     else:
            #                                         result.append(el)
            #                                 except Exception:
            #                                     result.append(el)
            #                             result = tuple(result)
            #                         # print('after  :', result)
            #                         listArgs = (listArgs[0], listArgs[1], listArgs[2], result)
            #                         listFunctionFound = inspect.getmembers(obj, inspect.isfunction)
            #                         listFunction = []
            #                         listTypeOut = []
            #                         for listF in listFunctionFound:
            #                             if (listF[0] != '__init__' and str(listF[0])[0] != '_'):
            #                                 try:
            #                                     a = listF[1].__annotations__['return']
            #                                     a = self.getNewAnnotation(a)
            #                                     listTypeOut.append(a)
            #                                     listFunction.append(listF[0])
            #                                 except Exception:
            #                                     print(listF[1] + 'has not annotation')
            #
            #                         # to put list out in order
            #                         k = len(listFunction)
            #                         srf = []
            #                         for k in listOrderClass:
            #                             srf.append(listFunction.index(k))
            #                         listTypeOut = [listTypeOut[i] for i in srf]
            #                         listClass.append((nameClass,
            #                                           listArgs[0],
            #                                           listArgs[3],
            #                                           listOrderClass,
            #                                           listTypeOut))
            #                         self.listBlocks[nameClass] = (rep + "." + name.replace('.py', ''),
            #                                                  (listArgs[0],
            #                                                  listArgs[3],
            #                                                  listOrderClass,
            #                                                  listTypeOut))
            #                         listCategory.append(nameClass)
            #                 except Exception as err:
            #                     print("error with modules:", nameClass, ":", err)
            #
            #         self.category[name.replace('.py', '')] = list(listClass)
            #         self.list_tree[name.replace('.py', '')] = listCategory 

    def findClassOrder(self, txtClass):
        listClass = []
        for line in txtClass.splitlines():
            if ('def ' in line and 'def __init__' not in line and 'def _' not in line):
                listClass.append(line[line.index('def ') + 4:line.index('(self')])
#         list.sort()
        return listClass

    def getNewAnnotation(self, anno):

        if anno is None:
            self.newAnno = 'path'
        elif anno.__name__ == 'list':
            if typing_inspect.get_origin(typing_inspect.get_args(anno)[0]) == list:
                tmpanno = typing_inspect.get_args(anno)[0]
                tmpanno = typing_inspect.get_args(tmpanno)[0]
                if tmpanno is None:
                    tmpanno = 'path'
                else:
                    tmpanno = tmpanno.__name__
                self.newAnno = 'array_' + tmpanno
            else:
                tmpanno = typing_inspect.get_args(anno)[0]
                if tmpanno is None:
                    tmpanno = 'path'
                else:
                    tmpanno = tmpanno.__name__
                self.newAnno = 'list_' + tmpanno
        else:
            self.newAnno = anno.__name__

        return self.newAnno

    def getIconPath(self):
        return self.icon

    def listInspect(self):
        return self.category
    
    def listBlocks(self):
        return self.listBlocks
    
    def listCat(self):
        return self.list_tree

    def listDepends(self):
        return set(self.listLib)
