class fsl_bet2:
    """
    docstring to be completed
    """
    def __init__(self,
                 input_file='path',
                 output_file='path',
                 **options):

        from subprocess import run
        list_options = []
        list_options.append(input_file)
        list_options.append(output_file)
        for op in options:
            list_options.append(op)
            if options[op]:
                list_options.append(str(options[op]))
        command = ["bet2"]
        command.extend(list_options)
        print('command : ', command)
        run(command, shell=False, check=True)
        self.outfile = output_file

    def output_file(self) -> None:
        return self.outfile

##############################################################################


class fslsplit():
    """
    docstring to be completed
    """
    def __init__(self,
                 input='path',
                 output_basename='path',
                 dimension="enumerate(('-t', '-x', '-y', '-z'))"):

        from subprocess import run
        import glob
        list_options = []
        list_options.append(input)
        list_options.append(output_basename)
        list_options.append(dimension)
        command = ["fslsplit"]
        command.extend(list_options)
        print('command : ', command)
        result = run(command, shell=False, check=True)
        self.outfile = glob.glob(output_basename + '*.nii.gz')
        self.outfile = sorted(self.outfile, reverse=False)

    def output_file(self) -> list[None]:
        return self.outfile

###############################################################################


class fslmerge():
    """
    docstring to be completed
    """
    def __init__(self,
                 dimension="enumerate(('-t', '-x', '-y', '-z', '-a', 'tr'))",
                 output='path',
                 in_files=['path'],
                 **options):

        from subprocess import run
        list_options = []
        list_options.append(dimension)
        list_options.append(output)
        list_options.extend(in_files)
        for op in options:
            list_options.append(op)
            if options[op]:
                list_options.append(str(options[op]))
        command = ["fslmerge"]
        command.extend(list_options)
        print('command : ', command)
        result = run(command, shell=False, check=True)
        self.outfile = output

    def output_file(self) -> None:
        return self.outfile

###############################################################################


class fsleyes():
    """
    docstring to be completed
    """
    def __init__(self,
                 images=['path'],
                 **options):

        from subprocess import Popen
        list_options = []
        if images[0] != 'path':
            for img in images:
                list_options.append(img)
            for op in options:
                list_options.append(op)
                if options[op]:
                    list_options.append(str(options[op]))
        command = "fsleyes " + " ".join(list_options)
        # command.extend(list_options)
        print('command : ', command)
        Popen(command, shell=True)
        # result = run(command, shell=False, check=True)

###############################################################################


class FSLeyes_Render:

    """
    Render a NIfTI image with FSLeyes and save
    the result as a PNG screenshot.

    Arguments:

        input_image : input NIfTI image
        output_image : PNG output image
        scene : ortho, lightbox or 3d
        cmap : FSLeyes colour map
        alpha : transparency in percent

    Note:

        dependencies: FSLeyes, Xvfb
        GUI: no
    """

    def __init__(self,
                 input_image="path",
                 output_image="path",
                 scene="enumerate(('ortho', 'lightbox', '3d'))",
                 cmap="greyscale",
                 alpha=1.0,
                 **options):

        self.input_image = input_image
        self.output_image = output_image
        self.scene = scene
        self.cmap = cmap
        self.alpha = alpha

        self.__run()

    def __run(self):

        import os
        import subprocess

        # ---------------------------------------------
        # Vérification du fichier d'entrée
        # ---------------------------------------------

        if not os.path.isfile(self.input_image):
            raise FileNotFoundError(
                "Input image does not exist:\n"
                + str(self.input_image)
            )

        # ---------------------------------------------
        # Création du répertoire de sortie
        # ---------------------------------------------

        output_dir = os.path.dirname(
            os.path.abspath(self.output_image)
        )

        if not os.path.exists(output_dir):
            os.makedirs(output_dir)

        # ---------------------------------------------
        # Commande FSLeyes
        # ---------------------------------------------

        cmd = [
            "xvfb-run",
            "-a",
            "fsleyes",
            "render",

            "-of",
            self.output_image,

            "--scene",
            self.scene,

            self.input_image
        ]

        # ---------------------------------------------
        # Colormap
        # ---------------------------------------------

        if self.cmap is not None:
            cmd += [
                "-cm",
                str(self.cmap)
            ]

        # ---------------------------------------------
        # Alpha
        # ---------------------------------------------

        if self.alpha is not None:
            cmd += [
                "-a",
                str(float(self.alpha) * 100)
            ]

        # ---------------------------------------------
        # Affichage
        # ---------------------------------------------

        print("")
        print("========================================")
        print("FSLeyes render")
        print("========================================")
        print(" ".join(cmd))
        print("")

        # ---------------------------------------------
        # Environnement
        # ---------------------------------------------

        env = os.environ.copy()

        # Rendu OpenGL logiciel
        env["LIBGL_ALWAYS_SOFTWARE"] = "1"

        # ---------------------------------------------
        # Exécution
        # ---------------------------------------------

        result = subprocess.run(
            cmd,
            env=env,
            capture_output=True,
            text=True
        )

        # ---------------------------------------------
        # Messages
        # ---------------------------------------------

        if result.stdout:
            print("FSLeyes stdout:")
            print(result.stdout)

        if result.stderr:
            print("FSLeyes stderr:")
            print(result.stderr)

        # ---------------------------------------------
        # Vérification
        # ---------------------------------------------

        if result.returncode != 0:

            raise RuntimeError(
                "FSLeyes render failed.\n"
                "Exit code: "
                + str(result.returncode)
                + "\n"
                + result.stderr
            )

        # ---------------------------------------------
        # Vérification du PNG
        # ---------------------------------------------

        if not os.path.isfile(self.output_image):

            raise RuntimeError(
                "FSLeyes finished successfully, "
                "but no PNG was created:\n"
                + str(self.output_image)
            )

        print("")
        print("PNG created:")
        print(self.output_image)
        print("")

    def output_png(self) -> None:

        return self.output_image
