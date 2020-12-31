# cubic-anarmonic-oscillator

This repo contains many scripts I used to study the behaviour of the Cubic Anharmonic Oscillator.

These are the scripts used to produce the graphs for my small bachelor thesis. A *non-exhaustive* explanation of the method used can be found in my blog: [Moller](https://superporchetta.github.io/2020/06/25/asymmetric-anarmonic-hoscillator.html "Moller Blog").

Also, as always, feel free to propose changes or improvements.

## File Explanation

Each file contains some variables that can be changed to make the program run a bit differently (I'm planning on making a small textual UI). A small explanation of the pourpose of each script is the following:

* **confront.m**: This script produces two graphs confronting the values obtained by the method in *sym_fundamental.m* and in *WKB_method.m*.
* **sym_better_fundamental.m**: This script computes the perturbation coefficients in an exact way but with a faster implementation than *sym_fundamental.m*.
* **sym_fundamental.m** : This script computes the perturbative coefficients exactly with perturbation theory.
* **variational.m**: to be done...
* **WKB_method.m**: This script computes the perturbative coefficients with the computationally more efficient WKB method.

#### WARNING

Some files may contain comments in Italian.
