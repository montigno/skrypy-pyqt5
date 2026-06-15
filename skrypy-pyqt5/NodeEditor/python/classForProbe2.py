class printProbe():
    def __init__(self, unit, lab, form, label, val, console):

        col = ''

        HTML_COLORS = {
            'int': '#0064FF',
            'float': '#C86400',
            'tuple': '#B4B4B4',
            'str': '#C800FA',
            'bool': '#32FA32',
            'path': '#FF6464',
            'dict': '#C8FA00',
        }
        
        ANSI_COLORS = {
            'int': '\x1b[38;2;0;100;255m',
            'float': '\x1b[38;2;200;100;0m',
            'tuple': '\x1b[38;2;200;180;180m',
            'str': '\x1b[38;2;200;0;250m',
            'bool': '\x1b[38;2;50;250;50m',
            'path': '\x1b[38;2;255;100;100m',
            'dict': '\x1b[38;2;200;250;0m',
        }

        colors = HTML_COLORS if console else ANSI_COLORS

        col = ''
        for key, color in colors.items():
            if key in form:
                col = color
                break

        if label == 'Type':
            tmpval = val
            continued = True
            if isinstance(tmpval, list):
                if val:
                    if isinstance(tmpval[0], list):
                        while continued:
                            if isinstance(tmpval, list):
                                tmpval = tmpval[0]
                            else:
                                val = 'array of ' + type(tmpval).__name__
                                continued = False
                    else:
                        val = 'list of ' + type(tmpval[0]).__name__

            else:
                val = type(tmpval).__name__
                if callable(tmpval):
                    val += ' method'

        elif label == 'Length':
            if isinstance(val, list):
                if val:
                    tmptxt = '('
                    tmpval = val
                    continued = True
                    if isinstance(tmpval, list):
                        while continued:
                            if isinstance(tmpval, list):
                                tmptxt += str(len(tmpval))
                                tmpval = tmpval[0]
                                tmptxt += ', '
                            else:
                                continued = False
                                tmptxt = tmptxt[0:-2] + ')'
                    else:
                        tmptxt = '1'
                    val = tmptxt
            elif type(val).__name__ in ['ndarray', 'memmap']:
                val = val.shape
            elif isinstance(val, tuple):
                val = len(val)
            else:
                val = '1'

        else:
            if callable(val):
                val = str(val)[1:-1]

        if console:
            console.append("<span style=\" \
                            font-family:'Monospace'; \
                            font-size:10pt; \
                            font-weight:400; \
                            color:{};\"> \
                            {} ({}) : {} = {} </span>".format(col, unit, lab, label, str(val)))
        else:
            self.return_for_ssh = [col, unit, lab, label, str(val)]

    def getList(self):
        return self.return_for_ssh
