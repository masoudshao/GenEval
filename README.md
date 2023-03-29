## GenEval
This software can estimate breeding values using either a random regeression model or a single trait. The software currently can analyse using a limited number of models and it's build only for speed and efficiency of the following models. 

### Random regression
The first type is a dataset of phenotyped individuals at different environments to estimate variance components and breeding values using an animal model. The model that is fitted is

$$y_{j,k} = (\mu_{int} + \mu_{slo} * X_{k}) + (A_{int_{j}} + A_{slo_{j}} * X_{k}) + (E_{int_{j,k}} + E_{slo_{j,k}} * X_{k}).$$
	
In the above linear random-regression model, $y_{j,k}$ is the phenotype of animal $j$ and environmental level $k$. The challenge level for environment $k$ is denoted by the covariate $X_{k}$. The three terms on the right-hand side of the above equation correspond to the mean ($\mu$), genetic deviation ($A$) and the residual ($E$). Each term is decomposed into a part for intercept (`int`) and slope (`slo`). Hence, the two fixed effects are the mean intercept and the mean slope. The random effects are genetic and environmental deviation bor both intercept and slope.

In the above model, it is assumed that the residual is heterogeneous. However, no correlation is assumed between the terms in the residual (`E_int{j,k}` and $E_{slo_{j,k}}$). The genetic terms, $A_{int_{j}}$ and $A_{slo_{j}}$, may be correlated. The covariance structure for the genetic terms has to be specified in the inputs (See Usage). 

### Single trait
In the second type, the locations are ignored and the aim is to estimate breeding values for individual using a single trait model

$$y{j} = mu + A_j + E_j$$

where $y_j$ is the phenotype of animal $j$, $A_j$ is its breeding value and $E_j$ is its residual. It is also possible to include a fixed effect in the model,

$$y{j} = mu + A_j + F_j + E_j$$

however, only one fixed effect is allowed at the moment and the number of levels for the fixed effect `F` should be provided.


# Installation
This software is written under FORTRAN90. The software can be built and installed using install.sh (under Unix OS). The name of compiler should be passed to variable FC in `install.sh` (tested with Intel FORTRAN and GFORTRAN (gcc version > 9.0)). 

## Dependencies
BLAS and LAPACK libraries are required for the compilation. If required, these libraries may be downloaded from [here](http://www.netlib.org/blas/blas.tgz) for BLAS and [here](http://www.netlib.org/lapack/lapack.tgz) for LAPACK and compiled based on the instructions from [here](https://gcc.gnu.org/wiki/GfortranBuild) (for Gfortran). For Intel Fortran these libraries use flag `-mkl`.

# Usage
The program is interactive and requires each input to be given separately. It is also possible to store the inputs in a separate file (e.g. `inputs.txt`) and use the input redirection operator `<`.
The phenotype file cannot have additional column and the order of columns are `id`, `effect`, `phenotype` or `id`, `phenotype`
The relationship matrix must be provided and must be in the packed format of `row`, `col`, `value`
Note: If the AIREML fails to converge to a set of feasible variance component, then use EMREML iterations. See Mitszal 2008 for more information.

## Testing
There are 3 different examples in test folder `input_<scenario>` for three different scenarios explained above. Three input files are provided that analyse these cases using [ASREML](https://vsni.co.uk/software/asreml "ASREML homepage"). The script `compare.sh` analyses these data with ASREML (provided it exists on the system) and the produced exectuable from `install.sh`. It then compares the estimated breeding value using
$$(ebv_{ASREML} - ebv_{GenEval})^2$$ 

## Outputs
The software provides estimated random and fix effects and variance components in the provided files.

