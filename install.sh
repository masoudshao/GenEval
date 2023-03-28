#/bin/sh
set -e
FC=ifort
export TMPDIR=/exports/eddie/scratch/mghaderi/tmp
flags="-mkl -static -qopenmp -check all"
## all function, subroutines and modules
UTL="src/utils/constants.f90 src/utils/askFilename.f90 src/utils/countNumberLines.f90 src/utils/detInv.f90 src/utils/dunpack.f90 src/utils/trace.f90 src/utils/global_module.f90"
MATH="src/math/stats.f90 src/math/math.f90"
SORT="src/quickSort/quickSort.f90"
REML="src/reml/calculateAImat.f90 src/reml/calculateLogL.f90 src/reml/calculaterhs.f90 src/reml/reml.f90 src/reml/updatetheta.f90 src/reml/reml_module.f90"
BLUP="src/blup/blup.f90 src/blup/BSRibsCalc.f90 src/blup/calculateP.f90 src/blup/calculateV.f90 src/blup/getEffects.f90 src/blup/getZGZMats.f90 src/blup/relationMatrix.f90 src/blup/getVariance.f90 src/blup/blup_module.f90"

# main file sources
SRC1="src/main/analysis.f90"

# exectuables
PRG1="analysis.exe"

# dependencies for programms
DEP1="$UTL $MATH $SORT $BLUP $REML"

# main commands
$FC $flags -o $PRG1 $DEP1 $SRC1

# if the program does not crash and reaches here, delete mod files
command rm *mod*
