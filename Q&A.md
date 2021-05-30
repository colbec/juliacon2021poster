Anticipated questions in Q&A session:

**Why don't you use an online service such as AWS?** They have rentable faster equipment.

True. On the other hand, standalone computers are useful in the context of smaller datasets and establishing a good and reliable pipeline which can later be transferred to an online service to run at high speed. It helps to ensure that no runaway processes are uploaded. Early in the learning process we make fast progress even on a plain CPU which helps to refine our baseline initialization of weights which can later be transferred to the much faster online service.

**Why don't you get a GPU?**

GPUs are expensive, run hot, and provide only a marginal improvement in speed of turnaround.

**What alternatives are there to announcing alerts through the speaker system?**

True, you might be in the kitchen making coffee and miss a notification. For important stuff we need an alternative communication method such as an email, text message or a phone call. Automated processes are possible - send e-mail through [Julia package SMTPClient](https://github.com/aviks/SMTPClient.jl) or drop a call file into an [Asterisk server](https://www.asterisk.org/).

**Temperature control on the CPU is managed by the chip internally with auto shut down. Why bother to control it yourself?**

To maintain the flow of the pipeline, preserve the state of variables and to increase the longevity of the chip. 

**Why don't you have a pure Julia version of these utilties?**

Right now the results come back quite fast, so there is no incentive to convert to pure Julia versions. I would have to spend time becoming familiar with the low level access to information; time is valuable and has to take its turn in the priorities of life.
