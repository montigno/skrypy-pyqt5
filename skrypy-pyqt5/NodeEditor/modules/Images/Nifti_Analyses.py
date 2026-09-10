class Nifti_Image_Info:

    """
    Note:
        dependencies: nibabel,numpy
        GUI: no
        link_web: (click Ctrl + U)
    """

    def __init__(self, in_file=["path"]):

        import nibabel as nib
        import numpy as np

        img = nib.load(in_file)

        self.res = {}

        self.res["shape"] = img.shape
        self.res["voxel_size"] = img.header.get_zooms()
        self.res["affine"] = img.affine
        self.res["header"] = img.header

        self.res["ndim"] = len(img.shape)
        self.res["n_voxels"] = int(np.prod(img.shape[:3]))

        voxel_size = img.header.get_zooms()[:3]

        self.res["voxel_volume"] = float(np.prod(voxel_size))
        self.res["image_volume"] = (
            self.res["n_voxels"] *
            self.res["voxel_volume"]
        )

    def shape(self) -> None:
        return self.res["shape"]

    def voxel_size(self) -> None:
        return self.res["voxel_size"]

    def voxel_volume(self) -> None:
        return self.res["voxel_volume"]

    def image_volume(self) -> None:
        return self.res["image_volume"]

    def affine(self) -> None:
        return self.res["affine"]

    def header(self) -> None:
        return self.res["header"]

    def ndim(self) -> None:
        return self.res["ndim"]

    def n_voxels(self) -> None:
        return self.res["n_voxels"]

##############################################################################


class Nifti_Histogram:

    """
    Note:
        dependencies: nibabel,numpy
        GUI: no
        link_web: (click Ctrl + U)
    """

    def __init__(
        self,
        in_file=["path"],
        mask=["path"],
        bins=256,
        remove_zero=True
    ):

        import nibabel as nib
        import numpy as np

        data = nib.load(in_file).get_fdata()

        if mask is not None:
            mask_data = nib.load(mask).get_fdata()
            data = data[mask_data > 0]
        else:
            data = data.ravel()

        data = data[np.isfinite(data)]

        if remove_zero:
            data = data[data != 0]

        histogram, bin_edges = np.histogram(
            data,
            bins=bins
        )

        density, density_edges = np.histogram(
            data,
            bins=bins,
            density=True
        )

        self.res = {
            "histogram": histogram,
            "bins": bin_edges,
            "density": density,
            "density_bins": density_edges
        }

    def histogram(self) -> None:
        return self.res["histogram"]

    def bins(self) -> None:
        return self.res["bins"]

    def density(self) -> None:
        return self.res["density"]

    def density_bins(self) -> None:
        return self.res["density_bins"]

##############################################################################


class Nifti_Spatial_Statistics:

    """
    Note:
        dependencies: nibabel,numpy,scipy
        GUI: no
        link_web: (click Ctrl + U)
    """

    def __init__(
        self,
        in_file=["path"],
        mask=["path"]
    ):

        import nibabel as nib
        import numpy as np
        from scipy import ndimage

        img = nib.load(in_file)
        data = img.get_fdata()

        if mask is not None:
            mask_data = nib.load(mask).get_fdata() > 0
        else:
            mask_data = data != 0

        coords = np.argwhere(mask_data)

        if len(coords) == 0:
            raise ValueError("Empty mask.")

        # Centre en coordonnées voxel
        center_voxel = np.mean(coords, axis=0)

        # Centre en coordonnées monde
        center_world = nib.affines.apply_affine(
            img.affine,
            center_voxel
        )

        voxel_size = img.header.get_zooms()[:3]

        volume = (
            np.sum(mask_data) *
            np.prod(voxel_size)
        )

        self.res = {
            "center_voxel": center_voxel,
            "center_world": center_world,
            "n_voxels": int(np.sum(mask_data)),
            "volume": float(volume),
            "bounding_box_min": np.min(coords, axis=0),
            "bounding_box_max": np.max(coords, axis=0)
        }

    def center_voxel(self) -> None:
        return self.res["center_voxel"]

    def center_world(self) -> None:
        return self.res["center_world"]

    def n_voxels(self) -> None:
        return self.res["n_voxels"]

    def volume(self) -> None:
        return self.res["volume"]

    def bounding_box_min(self) -> None:
        return self.res["bounding_box_min"]

    def bounding_box_max(self) -> None:
        return self.res["bounding_box_max"]

##############################################################################


class Nifti_Temporal_Statistics:

    """
    Note:
        dependencies: nibabel,numpy
        GUI: no
        link_web: (click Ctrl + U)
    """

    def __init__(
        self,
        in_file=["path"],
        mask=["path"]
    ):

        import nibabel as nib
        import numpy as np

        img = nib.load(in_file)
        data = img.get_fdata()

        if data.ndim != 4:
            raise ValueError(
                "A 4D NIfTI image is required."
            )

        if mask is not None:
            mask_data = nib.load(mask).get_fdata() > 0

            data = data[mask_data, :]

        else:
            data = data.reshape(-1, data.shape[3])

        # Moyenne temporelle de chaque voxel
        voxel_mean = np.mean(data, axis=1)

        # Ecart-type temporel de chaque voxel
        voxel_std = np.std(data, axis=1)

        # Moyenne de tous les voxels pour chaque temps
        temporal_mean = np.mean(data, axis=0)

        # Ecart-type pour chaque temps
        temporal_std = np.std(data, axis=0)

        # Variance temporelle
        temporal_variance = np.var(data, axis=0)

        # Coefficient de variation
        with np.errstate(divide="ignore", invalid="ignore"):
            temporal_cv = temporal_std / temporal_mean

        self.res = {
            "voxel_mean": voxel_mean,
            "voxel_std": voxel_std,
            "temporal_mean": temporal_mean,
            "temporal_std": temporal_std,
            "temporal_variance": temporal_variance,
            "temporal_cv": temporal_cv,
            "n_volumes": data.shape[1]
        }

    def voxel_mean(self) -> None:
        return self.res["voxel_mean"]

    def voxel_std(self) -> None:
        return self.res["voxel_std"]

    def temporal_mean(self) -> None:
        return self.res["temporal_mean"]

    def temporal_std(self) -> None:
        return self.res["temporal_std"]

    def temporal_variance(self) -> None:
        return self.res["temporal_variance"]

    def temporal_cv(self) -> None:
        return self.res["temporal_cv"]

    def n_volumes(self) -> None:
        return self.res["n_volumes"]

##############################################################################


class Nifti_SNR:

    """
    Note:
        dependencies: nibabel,numpy
        GUI: no
        link_web: (click Ctrl + U)
    """

    def __init__(
        self,
        signal=["path"],
        noise=["path"],
        signal_mask=["path"],
        noise_mask=["path"]
    ):

        import nibabel as nib
        import numpy as np

        signal_data = nib.load(signal).get_fdata()
        noise_data = nib.load(noise).get_fdata()

        if signal_mask is not None:
            sm = nib.load(signal_mask).get_fdata() > 0
            signal_values = signal_data[sm]
        else:
            signal_values = signal_data.ravel()

        if noise_mask is not None:
            nm = nib.load(noise_mask).get_fdata() > 0
            noise_values = noise_data[nm]
        else:
            noise_values = noise_data.ravel()

        signal_values = signal_values[
            np.isfinite(signal_values)
        ]

        noise_values = noise_values[
            np.isfinite(noise_values)
        ]

        signal_mean = np.mean(signal_values)
        noise_std = np.std(noise_values)

        if noise_std == 0:
            snr = np.inf
        else:
            snr = signal_mean / noise_std

        self.res = {
            "snr": snr,
            "signal_mean": signal_mean,
            "noise_std": noise_std
        }

    def snr(self) -> None:
        return self.res["snr"]

    def signal_mean(self) -> None:
        return self.res["signal_mean"]

    def noise_std(self) -> None:
        return self.res["noise_std"]

##############################################################################


class Nifti_CNR:

    """
    Note:
        dependencies: nibabel,numpy
        GUI: no
        link_web: (click Ctrl + U)
    """

    def __init__(
        self,
        in_file=["path"],
        mask_region1=["path"],
        mask_region2=["path"],
        noise_mask=["path"]
    ):

        import nibabel as nib
        import numpy as np

        data = nib.load(in_file).get_fdata()

        mask1 = nib.load(
            mask_region1
        ).get_fdata() > 0

        mask2 = nib.load(
            mask_region2
        ).get_fdata() > 0

        values1 = data[mask1]
        values2 = data[mask2]

        mean1 = np.mean(values1)
        mean2 = np.mean(values2)

        if noise_mask is not None:

            noise = nib.load(
                noise_mask
            ).get_fdata()

            noise_values = noise[
                noise != 0
            ]

            noise_std = np.std(noise_values)

        else:

            # Estimation à partir des deux régions
            noise_std = np.sqrt(
                (
                    np.var(values1) +
                    np.var(values2)
                ) / 2
            )

        if noise_std == 0:
            cnr = np.inf
        else:
            cnr = abs(mean1 - mean2) / noise_std

        self.res = {
            "cnr": cnr,
            "mean_region1": mean1,
            "mean_region2": mean2,
            "noise_std": noise_std
        }

    def cnr(self) -> None:
        return self.res["cnr"]

    def mean_region1(self) -> None:
        return self.res["mean_region1"]

    def mean_region2(self) -> None:
        return self.res["mean_region2"]

    def noise_std(self) -> None:
        return self.res["noise_std"]

##############################################################################


class Nifti_ROI_Statistics:

    """
    Note:
        dependencies: nibabel,numpy,pandas
        GUI: no
        link_web: (click Ctrl + U)
    """

    def __init__(
        self,
        in_file=["path"],
        roi=["path"],
        background_value=0
    ):

        import nibabel as nib
        import numpy as np

        data = nib.load(in_file).get_fdata()
        roi_data = nib.load(roi).get_fdata()

        labels = np.unique(roi_data)

        labels = labels[
            labels != background_value
        ]

        results = []

        for label in labels:

            values = data[
                roi_data == label
            ]

            values = values[
                np.isfinite(values)
            ]

            if len(values) == 0:
                continue

            q1 = np.percentile(values, 25)
            q3 = np.percentile(values, 75)

            results.append({
                "label": label,
                "n_voxels": len(values),
                "mean": np.mean(values),
                "median": np.median(values),
                "std": np.std(values),
                "min": np.min(values),
                "max": np.max(values),
                "p25": q1,
                "p75": q3,
                "volume": len(values) *
                          np.prod(
                              nib.load(
                                  in_file
                              ).header.get_zooms()[:3]
                          )
            })

        self.res = results

    def statistics(self) -> None:
        return self.res

    def labels(self) -> None:
        return [
            r["label"]
            for r in self.res
        ]

    def means(self) -> None:
        return [
            r["mean"]
            for r in self.res
        ]

    def medians(self) -> None:
        return [
            r["median"]
            for r in self.res
        ]

    def stds(self) -> None:
        return [
            r["std"]
            for r in self.res
        ]

    def volumes(self) -> None:
        return [
            r["volume"]
            for r in self.res
        ]

##############################################################################


class Nifti_Compare:

    """
    Note:
        dependencies: nibabel,numpy,scipy
        GUI: no
        link_web: (click Ctrl + U)
    """

    def __init__(
        self,
        reference=["path"],
        comparison=["path"],
        mask=["path"]
    ):

        import nibabel as nib
        import numpy as np
        from scipy.stats import pearsonr

        ref_img = nib.load(reference)
        cmp_img = nib.load(comparison)

        ref = ref_img.get_fdata()
        cmp = cmp_img.get_fdata()

        if ref.shape != cmp.shape:
            raise ValueError(
                "Images must have the same dimensions."
            )

        if mask is not None:

            mask_data = nib.load(
                mask
            ).get_fdata() > 0

            ref_values = ref[mask_data]
            cmp_values = cmp[mask_data]

        else:

            ref_values = ref.ravel()
            cmp_values = cmp.ravel()

        valid = (
            np.isfinite(ref_values) &
            np.isfinite(cmp_values)
        )

        ref_values = ref_values[valid]
        cmp_values = cmp_values[valid]

        difference = cmp_values - ref_values

        mae = np.mean(
            np.abs(difference)
        )

        mse = np.mean(
            difference ** 2
        )

        rmse = np.sqrt(mse)

        if (
            np.std(ref_values) > 0 and
            np.std(cmp_values) > 0
        ):

            correlation = pearsonr(
                ref_values,
                cmp_values
            ).statistic

        else:

            correlation = np.nan

        self.res = {
            "difference": difference,
            "mean_difference": np.mean(difference),
            "std_difference": np.std(difference),
            "mae": mae,
            "mse": mse,
            "rmse": rmse,
            "correlation": correlation
        }

    def difference(self) -> None:
        return self.res["difference"]

    def mean_difference(self) -> None:
        return self.res["mean_difference"]

    def std_difference(self) -> None:
        return self.res["std_difference"]

    def mae(self) -> None:
        return self.res["mae"]

    def mse(self) -> None:
        return self.res["mse"]

    def rmse(self) -> None:
        return self.res["rmse"]

    def correlation(self) -> None:
        return self.res["correlation"]

##############################################################################


class Nifti_Extract_Label_Atlas:

    """
    Note:
        dependencies: nibabel,numpy
        GUI: no
        link_web: (click Ctrl + U)
    """

    def __init__(
        self,
        atlas=["path"],
        label=1,
        output_file="extracted_label.nii.gz"
    ):

        import nibabel as nib
        import numpy as np

        # -------------------------------------------------
        # Load atlas
        # -------------------------------------------------

        img = nib.load(atlas)

        data = img.get_fdata()

        # -------------------------------------------------
        # Extract label
        # -------------------------------------------------

        binary = (
            data == label
        ).astype(np.uint8)

        # -------------------------------------------------
        # Create NIfTI image
        # -------------------------------------------------

        out_img = nib.Nifti1Image(
            binary,
            img.affine,
            img.header
        )

        # Set datatype explicitly
        out_img.set_data_dtype(np.uint8)

        # -------------------------------------------------
        # Save
        # -------------------------------------------------

        nib.save(
            out_img,
            output_file
        )

        # -------------------------------------------------
        # Results
        # -------------------------------------------------

        self.res = {
            "out_file": output_file,
            "n_voxels": int(np.sum(binary)),
            "volume_voxels": int(np.sum(binary))
        }

        voxel_size = img.header.get_zooms()[:3]

        self.res["volume_mm3"] = (
            np.sum(binary) *
            np.prod(voxel_size)
        )

    # =====================================================
    # Outputs
    # =====================================================

    def out_file(self) -> None:
        return self.res["out_file"]

    def n_voxels(self) -> None:
        return self.res["n_voxels"]

    def volume_voxels(self) -> None:
        return self.res["volume_voxels"]

    def volume_mm3(self) -> None:
        return self.res["volume_mm3"]

