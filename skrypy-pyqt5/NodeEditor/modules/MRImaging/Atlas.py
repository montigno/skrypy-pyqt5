class load_Atlas_labels_ITK():
    def __init__(self,
                 labels_file='path'):
        self.labels = {}
    
        with open(labels_file, encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                # Ignore comments and blank lines
                if not line or line.startswith("#"):
                    continue
                # Separate the fields
                fields = line.split(maxsplit=7)
                if len(fields) < 8:
                    continue
    
                value = int(fields[0])
                name = fields[7].strip('"')
    
                self.labels[name] = value
    
    def labels_out(self) -> dict:
        return self.labels

##############################################################################


class Atlas_erosion():
    def __init__(self,
                 atlas_file='path',
                 outfile='path',
                 verbose=True):
        import nibabel as nib
        import numpy as np
        from scipy.ndimage import binary_erosion
        import os

        img = nib.load(atlas_file)
        data = img.get_fdata()
        labels = np.unique(data)

        eroded_data = np.zeros_like(data, dtype=np.int16)
        for label in labels:
            # Ignore background
            if label == 0:
                continue
            if verbose:
                print(f"Érosion de la structure {label}")
            # structure mask
            mask = data == label
            # one pixel erosion
            eroded_mask = binary_erosion(
                mask,
                structure=np.ones((3, 3, 1)),
                iterations=1
            )
            # Reset the label value
            eroded_data[eroded_mask] = label
        
        new_img = nib.Nifti1Image(
            eroded_data,
            img.affine,
            img.header
        )
        
        new_img.set_data_dtype(np.int16)
        nib.save(new_img, outfile)
        
        self.outfile = outfile
        
    def eroded_atlas(self) -> None:
        return self.outfile

##############################################################################