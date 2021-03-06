# juliacon2021poster

The video published by Julia Computing can be found [here](https://www.youtube.com/watch?v=hU_heYdZOrI).

Three mini-utilities related perhaps directly to machine learning projects, but more generally to any project where lengthy, intensive computation happens, which is largely what Julia is about. The goal is to have a standalone computer manage itself as much as possible to allow full use of resources without interruption and only call on an operator when attention is needed:

`callout()`: uses [flite](https://github.com/festvox/flite) to announce a message through the local sound system when a significant point occurs in the learning process

`checkcpu()`: uses system routine [sensors](https://github.com/lm-sensors/lm-sensors) to measure the temperature of the CPU allowing the learning routine to take action if necessary without halting the process

`checkmem()`: uses system routine [free](https://gitlab.com/procps-ng/procps) to measure available free memory and take action if available memory is too limited without halting the process.

___

When using [Flux](https://github.com/FluxML/Flux.jl) as the main learning package, these functions can be added into the main routines in strategic locations. `checkcpu()` and `checkmem()` can be used in the callback to the `train!()` function, and the `callout()` can be used whereever the programme needs to call the attention of an operator.

`checkmem()` is particularly useful at the beginning of any run in REPL interactive mode since in back-to-back runs the memory may not be fully cleared. This can mean that an initial learning session may run without memory problems but a second identical run (with the same hyperparameters) has memory issues unless the REPL is shut down and restarted.

Anticipated questions listed in Q&A file.
