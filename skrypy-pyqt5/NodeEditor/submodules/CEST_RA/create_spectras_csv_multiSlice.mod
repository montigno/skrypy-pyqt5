[diagram]
link=[N67] node=[U2:newPath#Node#P0:Value]
probe=[P0] label=[Value] format=[path] RectF=[(-800.0, -1240.0, 70, 24)] 
link=[N66] node=[U26:temp_folder#Node#U27:path_in]
link=[N59] node=[A8:#Node#U27:path_name]
link=[N27] node=[U11:temp_folder#Node#U23:path_in]
link=[N26] node=[A12:#Node#U23:path_name]
link=[N25] node=[U21:coord_roi#Node#S0:coord_roi]
link=[N64] node=[S1:roi_path#Node#U21:roiIJ_file]
link=[N58] node=[C7:slice#Node#U18:index]
link=[N54] node=[C7:slice#Node#U19:index]
link=[N53] node=[U15:out_list#Node#U19:list_path_in]
link=[N50] node=[U13:out_list#Node#U18:list_path_in]
link=[N49] node=[U18:outPath#Node#U0:nifti_file]
link=[N48] node=[U19:outPath#Node#U1:nifti_file]
link=[N4] node=[S1:wassr_path#Node#U15:in_file]
link=[N1] node=[A6:#Node#U2:new_extension]
link=[N2] node=[S1:cest_path#Node#U13:in_file]
link=[N39] node=[U8:substring#Node#U20:stringIn_0]
link=[N38] node=[U8:substring#Node#U17:stringIn_0]
link=[N57] node=[A7:#Node#U20:stringIn_2]
link=[N52] node=[A7:#Node#U17:stringIn_2]
link=[N41] node=[S1:roi_nameout#Node#U20:stringIn]
link=[N34] node=[S1:roi_nameout#Node#U17:stringIn]
link=[N45] node=[C0:subject#Node#U8:in_string]
link=[N56] node=[A5:#Node#U8:start]
link=[N46] node=[A1:#Node#U8:end]
link=[N44] node=[A0:#Node#S0:ppm]
link=[N47] node=[C1:roi_name#Node#S1:roi_name]
link=[N29] node=[C0:subject#Node#S1:subject]
link=[N61] node=[U24:np_transpose#Node#U16:data]
link=[N55] node=[U22:array#Node#U24:a]
link=[N28] node=[A10:#Node#U17:stringIn_1]
link=[N36] node=[A11:#Node#U20:stringIn_1]
link=[N24] node=[S0:y_asym_mean#Node#U9:list_float_in_0]
link=[N23] node=[S0:x_asym#Node#U9:list_float_in]
link=[N31] node=[S0:y_cest_mean#Node#U22:list_float_in_0]
link=[N30] node=[S0:x_cest#Node#U22:list_float_in]
link=[N3] node=[S1:wassr_path#Node#U3:path_in]
link=[N0] node=[S1:cest_path#Node#U2:path_in]
link=[N17] node=[U1:image#Node#S0:wassr_img]
link=[N16] node=[U0:image#Node#S0:cest_img]
link=[N13] node=[U7:dict_json#Node#U6:input_dict]
link=[N8] node=[A3:#Node#U5:tag]
link=[N7] node=[U4:dict_json#Node#U5:input_dict]
link=[N6] node=[U2:newPath#Node#U4:json_file]
link=[N5] node=[A2:#Node#U3:new_extension]
link=[N9] node=[A4:#Node#U5:tag_0]
link=[N12] node=[U3:newPath#Node#U7:json_file]
link=[N14] node=[A4:#Node#U6:tag_0]
link=[N15] node=[A3:#Node#U6:tag]
link=[N10] node=[U5:out_value#Node#S0:cest_range]
link=[N11] node=[U6:out_value#Node#S0:wassr_range]
link=[N42] node=[A14:#Node#S0:correction_B0]
link=[N22] node=[U9:array#Node#U25:a]
link=[N62] node=[U25:np_transpose#Node#U10:data]
link=[N18] node=[C2:data_list#Node#S1:file_list]
link=[N19] node=[C3:dir_root#Node#S1:dir_root]
link=[N20] node=[C4:treatment_dir#Node#U14:path_in]
link=[N21] node=[U17:str_conc#Node#U14:path_name]
link=[N32] node=[U20:str_conc#Node#U12:path_name]
link=[N33] node=[C4:treatment_dir#Node#U12:path_in]
link=[N35] node=[U14:outFile#Node#U16:file_output]
link=[N37] node=[U12:outFile#Node#U10:file_output]
link=[N40] node=[U16:csv_out#Node#C5:zspectras_out]
link=[N43] node=[U10:csv_out#Node#C6:asym_out]
link=[N63] node=[S1:roi_nameout#Node#U21:roi_name]
link=[N65] node=[U0:image#Node#U21:image_in]
link=[N51] node=[U23:outFile#Node#U13:out_path]
link=[N60] node=[U27:outFile#Node#U15:out_path]
constant=[A8] value=['wassr_spectr'] format=[str] label=[path_name] RectF=[(-1740.0, -660.0, 98.0, 35.0)] 
constant=[A12] value=['cest_spectr'] format=[str] label=[path_name] RectF=[(-1820.0, -1560.0, 88.0, 35.0)] 
constant=[A6] value=['.json'] format=[str] label=[new_extension] RectF=[(-1160.0, -1300.0, 52.0, 35.0)] 
constant=[A7] value=['.csv'] format=[str] label=[stringIn_2] RectF=[(-760.0, -240.0, 47.0, 35.0)] 
constant=[A10] value=['_zspectra'] format=[str] label=[new_str] RectF=[(-840.0, -280.0, 78.0, 35.0)] 
constant=[A11] value=['_asym'] format=[str] label=[new_str] RectF=[(-860.0, -100.0, 61.0, 35.0)] 
constant=[A5] value=[(-100000, -6, 100000)] format=[int] label=[start] RectF=[(-2280.0, -340.0, 87.0, 31.0)] 
constant=[A1] value=[(-100000, -1, 100000)] format=[int] label=[end] RectF=[(-2280.0, -260.0, 87.0, 31.0)] 
constant=[A0] value=[(-100000.0, 3.0, 100000.0)] format=[float] label=[ppm] RectF=[(-140.0, -780.0, 131.0, 31.0)] 
constant=[A14] value=['wassr'] format=[enumerate(('no', 'wassr', 'cest_center'))] label=[A9] RectF=[(-120.0, -640.0, 109.0, 31.0)] 
constant=[A2] value=['.json'] format=[str] label=[new_extension] RectF=[(-1160.0, -900.0, 52.0, 35.0)] 
constant=[A3] value=['SatTransFreqRanges'] format=[str] label=[tag] RectF=[(-720.0, -1220.0, 140.0, 35.0)] 
constant=[A4] value=['value'] format=[str] label=[tag_0] RectF=[(-620.0, -1180.0, 56.0, 35.0)] 
block=[U27] category=[Tools.Path] class=[path_join_dyn] valInputs=[(['path_in', 'path_name'], ['Node(N66)', 'Node(N59)'], ['outFile'], ['path'])] RectF=[(-1600.0, -740.0, 160.0, 80.0)] 
block=[U26] category=[FileIO.Tools] class=[get_temporary_folder] valInputs=[([], [], ['temp_folder'], ['path'])] RectF=[(-1800.0, -780.0, 160.0, 80.0)] 
block=[U23] category=[Tools.Path] class=[path_join_dyn] valInputs=[(['path_in', 'path_name'], ['Node(N27)', 'Node(N26)'], ['outFile'], ['path'])] RectF=[(-1680.0, -1620.0, 160.0, 80.0)] 
block=[U11] category=[FileIO.Tools] class=[get_temporary_folder] valInputs=[([], [], ['temp_folder'], ['path'])] RectF=[(-1880.0, -1680.0, 160.0, 80.0)] 
block=[U21] category=[Images.ImageJ] class=[ImageJ_get_coord_roi] valInputs=[(['image_in', 'roiIJ_file', 'roi_name'], ['Node(N65)', 'Node(N64)', 'Node(N63)'], ['coord_roi'], ['list_float'])] RectF=[(-320.0, -540.0, 160.0, 120.0)] 
block=[U15] category=[Nipype.Interfaces_dcmstack] class=[dcmstack_SplitNifti] valInputs=[(['in_file', 'out_path'], ['Node(N4)', 'Node(N60)'], ['out_list'], ['list_path'])] RectF=[(-1200.0, -1220.0, 160.0, 80.0)] 
connt=[C7] name=[slice] type=[in] format=[int] valOut=[0] RectF=[(-2620.0, -720.0, 70, 24)] 
block=[U19] category=[Tools.Path_list] class=[path_list_getElement] valInputs=[(['list_path_in', 'index'], ['Node(N53)', 'Node(N54)'], ['outPath'], ['path'])] RectF=[(-940.0, -1140.0, 180.0, 80.0)] 
block=[U18] category=[Tools.Path_list] class=[path_list_getElement] valInputs=[(['list_path_in', 'index'], ['Node(N50)', 'Node(N58)'], ['outPath'], ['path'])] RectF=[(-980.0, -1540.0, 180.0, 80.0)] 
block=[U12] category=[Tools.Path] class=[path_join_dyn] valInputs=[(['path_in', 'path_name'], ['Node(N33)', 'Node(N32)'], ['outFile'], ['path'])] RectF=[(440.0, 120.0, 180.0, 120.0)] 
block=[U20] category=[Tools.String] class=[string_concatenat_dyn] valInputs=[(['stringIn', 'stringIn_0', 'stringIn_1', 'stringIn_2'], ['Node(N41)', 'Node(N39)', 'Node(N36)', 'Node(N57)'], ['str_conc'], ['str'])] RectF=[(-620.0, -180.0, 160.0, 100.0)] 
block=[U8] category=[Tools.String] class=[string_substring] valInputs=[(['in_string', 'start', 'end'], ['Node(N45)', 'Node(N56)', 'Node(N46)'], ['substring'], ['str'])] RectF=[(-2080.0, -380.0, 160.0, 80.0)] 
connt=[C1] name=[roi_name] type=[in] format=[str] valOut=[] RectF=[(-2640.0, -860.0, 70, 24)] 
connt=[C0] name=[subject] type=[in] format=[str] valOut=[] RectF=[(-2640.0, -980.0, 70, 24)] 
block=[U25] category=[Numpy.Nd_manipulation] class=[numpy_transpose] valInputs=[(['a'], ['Node(N22)'], ['np_transpose'], ['array_float'])] RectF=[(1680.0, -740.0, 160.0, 80.0)] 
block=[U24] category=[Numpy.Nd_manipulation] class=[numpy_transpose] valInputs=[(['a'], ['Node(N55)'], ['np_transpose'], ['array_float'])] RectF=[(1640.0, -1200.0, 160.0, 80.0)] 
block=[U16] category=[FileIO.Csv] class=[csv_save_file] valInputs=[(['file_output', 'header', 'data'], ['Node(N35)', [''], 'Node(N61)'], ['csv_out'], ['path'])] RectF=[(2000.0, -1120.0, 160.0, 80.0)] 
script=[S1] title=[Script_editor] inputs=[['file_list', 'in', 'path'], ['dir_root', 'in', 'path'], ['subject', 'in', 'str'], ['roi_name', 'in', 'str']] outputs=[['cest_path', 'out', 'path'], ['wassr_path', 'out', 'path'], ['roi_path', 'out', 'path'], ['roi_nameout', 'out', 'str']] code=[your code] RectF=[(-2360.0, -1400.0, 480.0, 380.0)]
script=[S0] title=[Script_editor] inputs=[['cest_img', 'in', 'array_float'], ['cest_range', 'in', 'array_float'], ['wassr_img', 'in', 'array_float'], ['wassr_range', 'in', 'array_float'], ['ppm', 'in', 'float'], ['correction_B0', 'in', 'str'], ['coord_roi', 'in', 'list_float']] outputs=[['y_cest', 'out', 'array_float'], ['y_cest_mean', 'out', 'list_float'], ['x_cest', 'out', 'list_float'], ['y_asym', 'out', 'array_float'], ['y_asym_mean', 'out', 'list_float'], ['x_asym', 'out', 'array_float'], ['map_asym', 'out', 'array_float']] code=[your code] RectF=[(160.0, -1560.0, 600.0, 1260.0)]
block=[U7] category=[FileIO.Json] class=[json_open_file] valInputs=[(['json_file'], ['Node(N12)'], ['dict_json'], ['dict'])] RectF=[(-700.0, -980.0, 160.0, 80.0)] 
block=[U6] category=[Tools.Dictionnary] class=[dict_get_value_dyn] valInputs=[(['input_dict', 'tag', 'tag_0'], ['Node(N13)', 'Node(N15)', 'Node(N14)'], ['out_value', 'out_value_dict'], ['str', 'dict'])] RectF=[(-260.0, -960.0, 240.0, 140.0)] 
block=[U4] category=[FileIO.Json] class=[json_open_file] valInputs=[(['json_file'], ['Node(N6)'], ['dict_json'], ['dict'])] RectF=[(-720.0, -1340.0, 160.0, 80.0)] 
block=[U0] category=[Images.Nifti] class=[nifti_open_file] valInputs=[(['nifti_file'], ['Node(N49)'], ['image', 'dim', 'pixdim'], ['array_float', 'int', 'list_float'])] RectF=[(-680.0, -1540.0, 160.0, 80.0)] 
block=[U1] category=[Images.Nifti] class=[nifti_open_file] valInputs=[(['nifti_file'], ['Node(N48)'], ['image', 'dim', 'pixdim'], ['array_float', 'int', 'list_float'])] RectF=[(-220.0, -1100.0, 160.0, 80.0)] 
block=[U2] category=[Tools.Path] class=[path_change_extension] valInputs=[(['path_in', 'new_extension'], ['Node(N0)', 'Node(N1)'], ['newPath'], ['path'])] RectF=[(-1060.0, -1340.0, 200.0, 80.0)] 
block=[U3] category=[Tools.Path] class=[path_change_extension] valInputs=[(['path_in', 'new_extension'], ['Node(N3)', 'Node(N5)'], ['newPath'], ['path'])] RectF=[(-980.0, -980.0, 200.0, 80.0)] 
block=[U5] category=[Tools.Dictionnary] class=[dict_get_value_dyn] valInputs=[(['input_dict', 'tag', 'tag_0'], ['Node(N7)', 'Node(N8)', 'Node(N9)'], ['out_value', 'out_value_dict'], ['str', 'dict'])] RectF=[(-260.0, -1280.0, 220.0, 140.0)] 
block=[U14] category=[Tools.Path] class=[path_join_dyn] valInputs=[(['path_in', 'path_name'], ['Node(N20)', 'Node(N21)'], ['outFile'], ['path'])] RectF=[(440.0, -80.0, 180.0, 120.0)] 
block=[U22] category=[Tools.Float_list] class=[float_list_to_array_dyn] valInputs=[(['list_float_in', 'list_float_in_0'], ['Node(N30)', 'Node(N31)'], ['array'], ['array_float'])] RectF=[(1400.0, -1220.0, 180.0, 80.0)] 
block=[U9] category=[Tools.Float_list] class=[float_list_to_array_dyn] valInputs=[(['list_float_in', 'list_float_in_0'], ['Node(N23)', 'Node(N24)'], ['array'], ['array_float'])] RectF=[(1420.0, -720.0, 180.0, 80.0)] 
block=[U10] category=[FileIO.Csv] class=[csv_save_file] valInputs=[(['file_output', 'header', 'data'], ['Node(N37)', [''], 'Node(N62)'], ['csv_out'], ['path'])] RectF=[(2000.0, -660.0, 160.0, 80.0)] 
connt=[C2] name=[data_list] type=[in] format=[path] valOut=[path] RectF=[(-2620.0, -1340.0, 70, 24)] 
connt=[C3] name=[dir_root] type=[in] format=[path] valOut=[path] RectF=[(-2620.0, -1260.0, 70, 24)] 
connt=[C4] name=[treatment_dir] type=[in] format=[path] valOut=[path] RectF=[(-2500.0, 240.0, 70, 24)] 
block=[U17] category=[Tools.String] class=[string_concatenat_dyn] valInputs=[(['stringIn', 'stringIn_0', 'stringIn_1', 'stringIn_2'], ['Node(N34)', 'Node(N38)', 'Node(N28)', 'Node(N52)'], ['str_conc'], ['str'])] RectF=[(-600.0, -360.0, 160.0, 100.0)] 
connt=[C5] name=[zspectras_out] type=[out] format=[path] RectF=[(2260.0, -1100.0, 70, 24)] 
connt=[C6] name=[asym_out] type=[out] format=[path] RectF=[(2280.0, -620.0, 70, 24)] 
block=[U13] category=[Nipype.Interfaces_dcmstack] class=[dcmstack_SplitNifti] valInputs=[(['in_file', 'out_path'], ['Node(N2)', 'Node(N51)'], ['out_list'], ['list_path'])] RectF=[(-1280.0, -1560.0, 160.0, 80.0)] 
[source S0]
["correction_B0='wassr'", 'wassr_range=U6:out_value', 'cest_range=U5:out_value', 'cest_img=U0:image', 'wassr_img=U1:image', 'ppm=3.0', 'coord_roi=U21:coord_roi']
from NodeEditor.modules.Tools.Float_array import float_array_add_row
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

y_cest, y_asym, x_asym, S0_cest = [], [], [], []

for i in range(x_img):
    for j in range(y_img):
        if sub_cest[i, j, 0] >10.0:
            try:
                cp = 0.0
                cest_cent = False
                if correction_B0 == 'wassr':
                    cp = WASSR_IA(sub_wassr[i, j, :], x_wassr).estimated_center_freq()
                    cest_cent = False
                elif correction_B0 == 'cest_center':
                    cest_cent = True
                vr = CEST_IA(sub_cest[i, j, :], x_cest, cp, ppm, 0.1, cest_cent)
                so = sub_cest[i, j, 0]
                map_asym[i, j] = vr.out_mapping()
                if [j, i] in coord_roi.tolist():
                    y_cest.append(vr.out_zspectra())
                    y_asym.append(vr.out_asym())
                    S0_cest.append(so)
                    #x_asym.append(vr.out_xasym())
            except Exception as err:
                print('error :', err)
                map_asym[ i, j] = 0.0
        else:
            map_asym[ i, j] = 0.0

#y_cest = np.array(y_cest)
y_cest_mean = np.mean( y_cest, axis=0 )
y_asym_mean = np.mean(y_asym, axis=0)
S0_cest_mean = np.mean(S0_cest)
x_cest = vr.out_xspectra()
x_asym = vr.out_xasym()

y_cest_mean = np.insert(y_cest_mean, 0, S0_cest_mean)
x_cest = np.insert(x_cest, 0, 0) 

['S0:y_cest', 'S0:y_cest_mean', 'S0:x_cest', 'S0:y_asym', 'S0:y_asym_mean', 'S0:x_asym', 'S0:map_asym']
[/source S0]
[source S1]
['dir_root=C3:dir_root', 'file_list=C2:data_list', 'subject=C0:subject', 'roi_name=C1:roi_name']
from NodeEditor.modules.FileIO.Yml import yaml_open_file
from NodeEditor.modules.Images.ImageJ import ImageJ_read_roi
import os

lst_f = yaml_open_file(file_list).dict_yaml()

cest_path = os.path.join(dir_root, lst_f[subject]['path_cest'])
wassr_path = os.path.join(dir_root, lst_f[subject]['path_wassr'])
roi_path = os.path.join(dir_root, lst_f[subject]['roi_zip_path'])

lst_roi = list(ImageJ_read_roi(roi_path).list_Rois().keys())
print('Roi list :', lst_roi)
roi_nameout = roi_name

if roi_name not in lst_roi:
    roi_nameout = lst_roi[0]

['S1:cest_path', 'S1:wassr_path', 'S1:roi_path', 'S1:roi_nameout']
[/source S1]

[execution]
['C2:data_list=', 'C3:dir_root=', 'C0:subject=', 'C1:roi_name=', 'C7:slice=', 'C4:treatment_dir=']
['S1', 'U8', 'U11', 'U26', 'ThreadOn', 'U27', 'U23', 'U20', 'U17', 'U3', 'U2', 'ThreadOff', 'ThreadOn', 'U15', 'U13', 'U4', 'U7', 'U14', 'U12', 'ThreadOff', 'ThreadOn', 'U19', 'U18', 'U6', 'U5', 'ThreadOff', 'ThreadOn', 'U0', 'U1', 'ThreadOff', 'U21', 'S0', 'ThreadOn', 'U9', 'U22', 'ThreadOff', 'ThreadOn', 'U24', 'U25', 'ThreadOff', 'P0', 'U10', 'U16']
{'U8': ('Tools.String', 'string_substring', "(['in_string', 'start', 'end'], ['C0:subject', -6, -1], ['substring'], ['str'])"), 'U11': ('FileIO.Tools', 'get_temporary_folder', "([], [], ['temp_folder'], ['path'])"), 'U26': ('FileIO.Tools', 'get_temporary_folder', "([], [], ['temp_folder'], ['path'])"), 'U27': ('Tools.Path', 'path_join_dyn', "(['path_in', 'path_name'], ['U26:temp_folder', 'wassr_spectr'], ['outFile'], ['path'])"), 'U23': ('Tools.Path', 'path_join_dyn', "(['path_in', 'path_name'], ['U11:temp_folder', 'cest_spectr'], ['outFile'], ['path'])"), 'U20': ('Tools.String', 'string_concatenat_dyn', "(['stringIn', 'stringIn_0', 'stringIn_1', 'stringIn_2'], ['S1:roi_nameout', 'U8:substring', '_asym', '.csv'], ['str_conc'], ['str'])"), 'U17': ('Tools.String', 'string_concatenat_dyn', "(['stringIn', 'stringIn_0', 'stringIn_1', 'stringIn_2'], ['S1:roi_nameout', 'U8:substring', '_zspectra', '.csv'], ['str_conc'], ['str'])"), 'U3': ('Tools.Path', 'path_change_extension', "(['path_in', 'new_extension'], ['S1:wassr_path', '.json'], ['newPath'], ['path'])"), 'U2': ('Tools.Path', 'path_change_extension', "(['path_in', 'new_extension'], ['S1:cest_path', '.json'], ['newPath'], ['path'])"), 'U15': ('Nipype.Interfaces_dcmstack', 'dcmstack_SplitNifti', "(['in_file', 'out_path'], ['S1:wassr_path', 'U27:outFile'], ['out_list'], ['list_path'])"), 'U13': ('Nipype.Interfaces_dcmstack', 'dcmstack_SplitNifti', "(['in_file', 'out_path'], ['S1:cest_path', 'U23:outFile'], ['out_list'], ['list_path'])"), 'U4': ('FileIO.Json', 'json_open_file', "(['json_file'], ['U2:newPath'], ['dict_json'], ['dict'])"), 'U7': ('FileIO.Json', 'json_open_file', "(['json_file'], ['U3:newPath'], ['dict_json'], ['dict'])"), 'U14': ('Tools.Path', 'path_join_dyn', "(['path_in', 'path_name'], ['C4:treatment_dir', 'U17:str_conc'], ['outFile'], ['path'])"), 'U12': ('Tools.Path', 'path_join_dyn', "(['path_in', 'path_name'], ['C4:treatment_dir', 'U20:str_conc'], ['outFile'], ['path'])"), 'U19': ('Tools.Path_list', 'path_list_getElement', "(['list_path_in', 'index'], ['U15:out_list', 'C7:slice'], ['outPath'], ['path'])"), 'U18': ('Tools.Path_list', 'path_list_getElement', "(['list_path_in', 'index'], ['U13:out_list', 'C7:slice'], ['outPath'], ['path'])"), 'U6': ('Tools.Dictionnary', 'dict_get_value_dyn', "(['input_dict', 'tag', 'tag_0'], ['U7:dict_json', 'SatTransFreqRanges', 'value'], ['out_value', 'out_value_dict'], ['str', 'dict'])"), 'U5': ('Tools.Dictionnary', 'dict_get_value_dyn', "(['input_dict', 'tag', 'tag_0'], ['U4:dict_json', 'SatTransFreqRanges', 'value'], ['out_value', 'out_value_dict'], ['str', 'dict'])"), 'U0': ('Images.Nifti', 'nifti_open_file', "(['nifti_file'], ['U18:outPath'], ['image', 'dim', 'pixdim'], ['array_float', 'int', 'list_float'])"), 'U1': ('Images.Nifti', 'nifti_open_file', "(['nifti_file'], ['U19:outPath'], ['image', 'dim', 'pixdim'], ['array_float', 'int', 'list_float'])"), 'U21': ('Images.ImageJ', 'ImageJ_get_coord_roi', "(['image_in', 'roiIJ_file', 'roi_name'], ['U0:image', 'S1:roi_path', 'S1:roi_nameout'], ['coord_roi'], ['list_float'])"), 'U9': ('Tools.Float_list', 'float_list_to_array_dyn', "(['list_float_in', 'list_float_in_0'], ['S0:x_asym', 'S0:y_asym_mean'], ['array'], ['array_float'])"), 'U22': ('Tools.Float_list', 'float_list_to_array_dyn', "(['list_float_in', 'list_float_in_0'], ['S0:x_cest', 'S0:y_cest_mean'], ['array'], ['array_float'])"), 'U24': ('Numpy.Nd_manipulation', 'numpy_transpose', "(['a'], ['U22:array'], ['np_transpose'], ['array_float'])"), 'U25': ('Numpy.Nd_manipulation', 'numpy_transpose', "(['a'], ['U9:array'], ['np_transpose'], ['array_float'])"), 'P0': ('path', 'Value', 'U2:newPath'), 'U10': ('FileIO.Csv', 'csv_save_file', "(['file_output', 'header', 'data'], ['U12:outFile', [''], 'U25:np_transpose'], ['csv_out'], ['path'])"), 'U16': ('FileIO.Csv', 'csv_save_file', "(['file_output', 'header', 'data'], ['U14:outFile', [''], 'U24:np_transpose'], ['csv_out'], ['path'])")}
['U2:newPath', 'U26:temp_folder', 'U11:temp_folder', 'U21:coord_roi', 'S1:roi_path', 'U15:out_list', 'U13:out_list', 'U18:outPath', 'U19:outPath', 'S1:wassr_path', 'S1:cest_path', 'U8:substring', 'U8:substring', 'S1:roi_nameout', 'S1:roi_nameout', 'U24:np_transpose', 'U22:array', 'S0:y_asym_mean', 'S0:x_asym', 'S0:y_cest_mean', 'S0:x_cest', 'S1:wassr_path', 'S1:cest_path', 'U1:image', 'U0:image', 'U7:dict_json', 'U4:dict_json', 'U2:newPath', 'U3:newPath', 'U5:out_value', 'U6:out_value', 'U9:array', 'U25:np_transpose', 'U17:str_conc', 'U20:str_conc', 'U14:outFile', 'U12:outFile', 'U16:csv_out', 'U10:csv_out', 'S1:roi_nameout', 'U0:image', 'U23:outFile', 'U27:outFile']
{}
['C5:zspectras_out=U16:csv_out', 'C6:asym_out=U10:csv_out']
[interlinks]
[]
