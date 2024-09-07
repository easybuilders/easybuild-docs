# pytorch-3dunet

PyTorch implementation of 3D U-Net and its variants:  - UNet3D: Standard 3D U-Net based on 3D U-Net: Learning Dense Volumetric          Segmentation from Sparse Annotation   - ResidualUNet3D: Residual 3D U-Net based on Superhuman Accuracy on the SNEMI3D    Connectomics Challenge   - ResidualUNetSE3D: Similar to ResidualUNet3D with the addition of Squeeze and     Excitation blocks based on Deep Learning Semantic Segmentation for High-         Resolution Medical Volumes. Original squeeze and excite paper: Squeeze-and-      Excitation Networks The code allows for training the U-Net for both: semantic segmentation (binary   and multi-class) and regression problems (e.g. de-noising, learning              deconvolutions).

*homepage*: <https://github.com/wolny/pytorch-3dunet>

version | versionsuffix | toolchain
--------|---------------|----------
``1.6.0`` | ``-CUDA-11.7.0`` | ``foss/2022a``
