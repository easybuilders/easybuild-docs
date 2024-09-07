# MotionCor3

Anisotropic correction of beam induced motion for cryo-electron microscopy and   cryo-electron tomography images. MotionCor3, an improved implementation of MotionCor2 with addition of CTF        (Contrast Transfer Function) estimation, is a multi-GPU accelerated software     package that enables single-pixel level correction of anisotropic beam induced   sample motion for cryo-electron microscopy and cryo-electron tomography images.  The iterative, patch-based motion detection combined with spatial and temporal   constraints and dose weighting provides robust and accurate correction. By       refining the measurement of early motion, MotionCor3 further improves correction on tilted samples. The efficiency achieved by multi-GPU acceleration and         parallelization enables correction to keep pace with automated data collection.  The recent addition of a very robust GPU-accelerated CTF estimation makes        MotionCor3 more versatile in cryoEM and cryoET processing pipeline.

*homepage*: <https://github.com/czimaginginstitute/MotionCor3>

version | versionsuffix | toolchain
--------|---------------|----------
``1.0.1`` | ``-CUDA-12.1.1`` | ``GCCcore/12.3.0``
