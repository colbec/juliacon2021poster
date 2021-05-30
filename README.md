# juliacon2021poster

Detail on proposed virtual poster presentation for JuliaCon 2021

Three mini-utilities related to machine learning projects; the goal is to have a standalone computer manage itself as much as possible to allow full use of resources and only call on an operator when attention is needed:

`callout()`: uses [flite](https://github.com/festvox/flite) to announce a message through loudspeakers when a significant point occurs in the learning process

`checkcpu()`: uses system routine [sensors](https://github.com/lm-sensors/lm-sensors) to measure the temperature of the CPU allowing the learning routine to take action if necessary

`checkmem()`: uses system routine [free](https://gitlab.com/procps-ng/procps) to measure available free memory and take action if available memory is too limited.

___

When using [Flux](https://github.com/FluxML/Flux.jl) as the main learning package, these functions can be added into the main routines in strategic locations. `checkcpu()` and `checkmem()` can be used in the callback to the `train!()` function, and the `callout()` can be used whereever the programme needs to call the attention of an operator.

`checkmem()` is particularly useful at the beginning of any run in REPL interactive mode since in back-to-back runs the memory may not be fully cleared. This can mean that one learning session will run without memory problems but a second identical run (with the same hyperparameters) has memory issues unless the REPL is shut down and restarted from scratch.

First version of video can be found at https://youtu.be/rj9DgyFkn6Y

Anticipated questions listed in Q&A file.
