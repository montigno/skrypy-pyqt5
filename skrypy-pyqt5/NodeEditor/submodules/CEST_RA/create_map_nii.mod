[diagram]
link=[N26] node=[C4:treatment_dir#Node#U14:path_in]
link=[N25] node=[C3:ppm#Node#U19:stringIn_0]
link=[N18] node=[C3:ppm#Node#S0:ppm]
link=[N24] node=[C2:subject#Node#U15:stringIn]
link=[N23] node=[C2:subject#Node#S1:subject]
link=[N22] node=[C1:dir_root#Node#S1:dir_root]
link=[N21] node=[C0:data_list#Node#S1:file_list]
link=[N49] node=[U15:str_conc#Node#U14:path_name]
link=[N48] node=[A6:#Node#U15:stringIn_0]
link=[N19] node=[S0:map_asym#Node#U8:image]
link=[N3] node=[S1:wassr_path#Node#U3:path_in]
link=[N1] node=[S1:wassr_path#Node#U1:nifti_file]
link=[N2] node=[S1:cest_path#Node#U0:nifti_file]
link=[N0] node=[S1:cest_path#Node#U2:path_in]
link=[N17] node=[U1:image#Node#S0:wassr_img]
link=[N16] node=[U0:image#Node#S0:cest_img]
link=[N13] node=[U7:dict_json#Node#U6:input_dict]
link=[N8] node=[A3:#Node#U5:tag]
link=[N7] node=[U4:dict_json#Node#U5:input_dict]
link=[N6] node=[U2:newPath#Node#U4:json_file]
link=[N5] node=[A2:#Node#U3:new_extension]
link=[N4] node=[A2:#Node#U2:new_extension]
link=[N9] node=[A4:#Node#U5:tag_0]
link=[N12] node=[U3:newPath#Node#U7:json_file]
link=[N14] node=[A4:#Node#U6:tag_0]
link=[N15] node=[A3:#Node#U6:tag]
link=[N10] node=[U5:out_value#Node#S0:cest_range]
link=[N11] node=[U6:out_value#Node#S0:wassr_range]
link=[N42] node=[A14:#Node#S0:correction_B0]
link=[N56] node=[A7:#Node#U19:stringIn]
link=[N58] node=[A17:#Node#U19:stringIn_1]
link=[N59] node=[U19:str_conc#Node#U18:new_str]
link=[N20] node=[U14:outFile#Node#U18:path_in]
link=[N60] node=[U18:newPath#Node#U8:nifti_path]
link=[N27] node=[U8:pathFile#Node#C5:out_map]
link=[N28] node=[A7:#Node#U19:stringIn_2]
link=[N29] node=[A14:#Node#U19:stringIn_3]
constant=[A14] value=['wassr'] format=[enumerate(('no', 'wassr', 'cest_center'))] label=[A9] RectF=[(-120.0, -480.0, 109.0, 31.0)] 
constant=[A2] value=['.json'] format=[str] label=[new_extension] RectF=[(-1400.0, -1260.0, 52.0, 35.0)] 
constant=[A6] value=['.nii'] format=[str] label=[stringIn_0] RectF=[(-2000.0, -640.0, 42.0, 35.0)] 
constant=[A3] value=['SatTransFreqRanges'] format=[str] label=[tag] RectF=[(-680.0, -1180.0, 140.0, 35.0)] 
constant=[A4] value=['value'] format=[str] label=[tag_0] RectF=[(-600.0, -1080.0, 56.0, 35.0)] 
constant=[A17] value=['ppm'] format=[str] label=[stringIn_1] RectF=[(20.0, 180.0, 51.0, 35.0)] 
constant=[A7] value=['_'] format=[str] label=[stringIn] RectF=[(40.0, 60.0, 32.0, 35.0)] 
connt=[C4] name=[treatment_dir] type=[in] format=[path] valOut=[path] RectF=[(-2480.0, 60.0, 70, 24)] 
connt=[C3] name=[ppm] type=[in] format=[float] valOut=[0.0] RectF=[(-2480.0, -380.0, 70, 24)] 
connt=[C2] name=[subject] type=[in] format=[str] valOut=[] RectF=[(-2460.0, -880.0, 70, 24)] 
connt=[C1] name=[dir_root] type=[in] format=[path] valOut=[path] RectF=[(-2460.0, -1160.0, 70, 24)] 
connt=[C0] name=[data_list] type=[in] format=[path] valOut=[path] RectF=[(-2460.0, -1260.0, 70, 24)] 
block=[U15] category=[Tools.String] class=[string_concatenat_dyn] valInputs=[(['stringIn', 'stringIn_0'], ['Node(N24)', 'Node(N48)'], ['str_conc'], ['str'])] RectF=[(-1880.0, -680.0, 160.0, 80.0)] 
script=[S1] title=[Script_editor] inputs=[['file_list', 'in', 'path'], ['dir_root', 'in', 'path'], ['subject', 'in', 'str']] outputs=[['cest_path', 'out', 'path'], ['wassr_path', 'out', 'path']] code=[your code] RectF=[(-2080.0, -1320.0, 520.0, 480.0)]
script=[S0] title=[Script_editor] inputs=[['cest_img', 'in', 'array_float'], ['cest_range', 'in', 'array_float'], ['wassr_img', 'in', 'array_float'], ['wassr_range', 'in', 'array_float'], ['ppm', 'in', 'float'], ['correction_B0', 'in', 'str']] outputs=[['map_asym', 'out', 'array_float']] code=[your code] RectF=[(160.0, -1560.0, 600.0, 1260.0)]
block=[U7] category=[FileIO.Json] class=[json_open_file] valInputs=[(['json_file'], ['Node(N12)'], ['dict_json'], ['dict'])] RectF=[(-660.0, -980.0, 160.0, 80.0)] 
block=[U6] category=[Tools.Dictionnary] class=[dict_get_value_dyn] valInputs=[(['input_dict', 'tag', 'tag_0'], ['Node(N13)', 'Node(N15)', 'Node(N14)'], ['out_value', 'out_value_dict'], ['str', 'dict'])] RectF=[(-320.0, -1060.0, 240.0, 140.0)] 
block=[U4] category=[FileIO.Json] class=[json_open_file] valInputs=[(['json_file'], ['Node(N6)'], ['dict_json'], ['dict'])] RectF=[(-660.0, -1420.0, 160.0, 80.0)] 
block=[U0] category=[Images.Nifti] class=[nifti_open_file] valInputs=[(['nifti_file'], ['Node(N2)'], ['image', 'dim', 'pixdim'], ['array_float', 'int', 'list_float'])] RectF=[(-1180.0, -1620.0, 160.0, 80.0)] 
block=[U1] category=[Images.Nifti] class=[nifti_open_file] valInputs=[(['nifti_file'], ['Node(N1)'], ['image', 'dim', 'pixdim'], ['array_float', 'int', 'list_float'])] RectF=[(-1180.0, -1260.0, 160.0, 80.0)] 
block=[U2] category=[Tools.Path] class=[path_change_extension] valInputs=[(['path_in', 'new_extension'], ['Node(N0)', 'Node(N4)'], ['newPath'], ['path'])] RectF=[(-1200.0, -1460.0, 200.0, 80.0)] 
block=[U3] category=[Tools.Path] class=[path_change_extension] valInputs=[(['path_in', 'new_extension'], ['Node(N3)', 'Node(N5)'], ['newPath'], ['path'])] RectF=[(-1200.0, -1100.0, 200.0, 80.0)] 
block=[U5] category=[Tools.Dictionnary] class=[dict_get_value_dyn] valInputs=[(['input_dict', 'tag', 'tag_0'], ['Node(N7)', 'Node(N8)', 'Node(N9)'], ['out_value', 'out_value_dict'], ['str', 'dict'])] RectF=[(-340.0, -1320.0, 220.0, 140.0)] 
block=[U8] category=[Images.Nifti] class=[nifti_save_file] valInputs=[(['image', 'nifti_path'], ['Node(N19)', 'Node(N60)'], ['pathFile'], ['path'])] RectF=[(1340.0, 0.0, 160.0, 80.0)] 
block=[U14] category=[Tools.Path] class=[path_join_dyn] valInputs=[(['path_in', 'path_name'], ['Node(N26)', 'Node(N49)'], ['outFile'], ['path'])] RectF=[(-1280.0, -40.0, 180.0, 120.0)] 
block=[U18] category=[Tools.Path] class=[path_add_suffixprefix] valInputs=[(['path_in', 'new_str', 'place'], ['Node(N20)', 'Node(N59)', 'suffix'], ['newPath'], ['path'])] RectF=[(920.0, 0.0, 160.0, 80.0)] 
connt=[C5] name=[out_map] type=[out] format=[path] RectF=[(1600.0, 20.0, 70, 24)] 
block=[U19] category=[Tools.String] class=[string_concatenat_dyn] valInputs=[(['stringIn', 'stringIn_0', 'stringIn_1', 'stringIn_2', 'stringIn_3'], ['Node(N56)', 'Node(N25)', 'Node(N58)', 'Node(N28)', 'Node(N29)'], ['str_conc'], ['str'])] RectF=[(200.0, 100.0, 160.0, 120.0)] 
[source S0]
["correction_B0='wassr'", 'wassr_range=U6:out_value', 'cest_range=U5:out_value', 'cest_img=U0:image', 'wassr_img=U1:image', 'ppm=C3:ppm']
from NodeEditor.modules.Tools.Float_array import float_array_add_row
from NodeEditor.modules.MRImaging.Irmage import CEST_2
from NodeEditor.modules.MRImaging.Irmage import CEST_IA
from NodeEditor.modules.MRImaging.Irmage import WASSR_IA
import numpy as np

xmin = cest_range[0][0]
xmax = cest_range[1][0]
delta_x = cest_range[2][0]
x_cest = np.linspace(xmin,  xmax, int(1 + (xmax - xmin) / delta_x))

#################################################

xmin = wassr_range[0][0]
xmax = wassr_range[1][0]
delta_x = wassr_range[2][0]
x_wassr= np.linspace(xmin,  xmax, int(1 + (xmax - xmin) / delta_x))

#################################################

sub_cest = np.squeeze(cest_img)
sub_wassr = np.squeeze(wassr_img)

if len(x_wassr) == len(sub_wassr[0, 0, :]):
    x_wassr = x_wassr[0:-1]

x_img, y_img, z_img = np.shape(sub_cest)
map_asym = sub_cest[:, :, 0]

for i in range(x_img):
    for j in range(y_img):
        if sub_cest[i, j, 0] >5.0:
            try:
                cp = 0.0
                cest_cent = False
                if correction_B0 == 'wassr':
                    cp = WASSR_IA(sub_wassr[i, j, :], x_wassr).estimated_center_freq()
                    cest_cent = False
                elif correction_B0 == 'cest_center':
                    cest_cent = True
                vr = CEST_2(sub_cest[i, j, :], x_cest, cp, ppm, 0.1, cest_cent, n_interp=10)
                map_asym[i, j] = vr.out_mapping()
            except Exception as err:
                print('error :', err)
                map_asym[ i, j] = 0.0
        else:
            map_asym[ i, j] = 0.0
['S0:map_asym']
[/source S0]
[source S1]
['file_list=C0:data_list', 'dir_root=C1:dir_root', 'subject=C2:subject']
from NodeEditor.modules.FileIO.Yml import yaml_open_file
import os

lst_f = yaml_open_file(file_list).dict_yaml()

cest_path = os.path.join(dir_root, lst_f[subject]['path_cest'])
wassr_path = os.path.join(dir_root, lst_f[subject]['path_wassr'])
#roi_path = os.path.join(dir_root, lst_f[subject]['roi_zip_path'])


['S1:cest_path', 'S1:wassr_path']
[/source S1]

[execution]
['C0:data_list=', 'C1:dir_root=', 'C2:subject=', 'C3:ppm=', 'C4:treatment_dir=']
['S1', 'U15', 'U19', 'ThreadOn', 'U14', 'U3', 'U1', 'U0', 'U2', 'ThreadOff', 'ThreadOn', 'U4', 'U7', 'U18', 'ThreadOff', 'ThreadOn', 'U6', 'U5', 'ThreadOff', 'S0', 'U8']
{'U15': ('Tools.String', 'string_concatenat_dyn', "(['stringIn', 'stringIn_0'], ['C2:subject', '.nii'], ['str_conc'], ['str'])"), 'U19': ('Tools.String', 'string_concatenat_dyn', "(['stringIn', 'stringIn_0', 'stringIn_1', 'stringIn_2', 'stringIn_3'], ['_', 'C3:ppm', 'ppm', '_', 'wassr'], ['str_conc'], ['str'])"), 'U14': ('Tools.Path', 'path_join_dyn', "(['path_in', 'path_name'], ['C4:treatment_dir', 'U15:str_conc'], ['outFile'], ['path'])"), 'U3': ('Tools.Path', 'path_change_extension', "(['path_in', 'new_extension'], ['S1:wassr_path', '.json'], ['newPath'], ['path'])"), 'U1': ('Images.Nifti', 'nifti_open_file', "(['nifti_file'], ['S1:wassr_path'], ['image', 'dim', 'pixdim'], ['array_float', 'int', 'list_float'])"), 'U0': ('Images.Nifti', 'nifti_open_file', "(['nifti_file'], ['S1:cest_path'], ['image', 'dim', 'pixdim'], ['array_float', 'int', 'list_float'])"), 'U2': ('Tools.Path', 'path_change_extension', "(['path_in', 'new_extension'], ['S1:cest_path', '.json'], ['newPath'], ['path'])"), 'U4': ('FileIO.Json', 'json_open_file', "(['json_file'], ['U2:newPath'], ['dict_json'], ['dict'])"), 'U7': ('FileIO.Json', 'json_open_file', "(['json_file'], ['U3:newPath'], ['dict_json'], ['dict'])"), 'U18': ('Tools.Path', 'path_add_suffixprefix', "(['path_in', 'new_str', 'place'], ['U14:outFile', 'U19:str_conc', 'suffix'], ['newPath'], ['path'])"), 'U6': ('Tools.Dictionnary', 'dict_get_value_dyn', "(['input_dict', 'tag', 'tag_0'], ['U7:dict_json', 'SatTransFreqRanges', 'value'], ['out_value', 'out_value_dict'], ['str', 'dict'])"), 'U5': ('Tools.Dictionnary', 'dict_get_value_dyn', "(['input_dict', 'tag', 'tag_0'], ['U4:dict_json', 'SatTransFreqRanges', 'value'], ['out_value', 'out_value_dict'], ['str', 'dict'])"), 'U8': ('Images.Nifti', 'nifti_save_file', "(['image', 'nifti_path'], ['S0:map_asym', 'U18:newPath'], ['pathFile'], ['path'])")}
['U15:str_conc', 'S0:map_asym', 'S1:wassr_path', 'S1:wassr_path', 'S1:cest_path', 'S1:cest_path', 'U1:image', 'U0:image', 'U7:dict_json', 'U4:dict_json', 'U2:newPath', 'U3:newPath', 'U5:out_value', 'U6:out_value', 'U19:str_conc', 'U14:outFile', 'U18:newPath', 'U8:pathFile']
{}
['C5:out_map=U8:pathFile']
[interlinks]
[]
