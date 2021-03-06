Anticipated questions in Q&A session:

**Instead of shelling out to flite to make announcements, why not use a pure Julia application such as LibSndFile?**

True, LibSndFile can output plain sounds, but I am thinking in terms of actual words enunciated, which flite is able to do. An alternative is to use Festival running as a server, but that is a larger application. Another advantage of flite is a choice of voices and even different languages. There are a number of different alternatives for output of voices, but flite happens to be open source and free of encumbrances.

**Why don't you use an online service such as AWS? They have rentable faster equipment.**

True. On the other hand, standalone computers are useful in the context of smaller datasets and experimenting with and establishing a good and reliable pipeline which can later be transferred to an online service to run at high speed. It helps to ensure that no runaway processes are uploaded. Early in the learning process we make fast progress even on a plain CPU which helps to refine our baseline initialization of weights which can later be transferred to the much faster online service.

**Why don't you get a GPU?**

GPUs are expensive, run hot, and provide only a marginal improvement in speed of turnaround.

**What alternatives are there to announcing alerts through the speaker system?**

True, you might be in the kitchen making coffee and miss a notification. For important stuff we need an alternative communication method such as an email, text message or a phone call. Automated processes are possible - send e-mail through [Julia package SMTPClient](https://github.com/aviks/SMTPClient.jl) or drop a call file into an [Asterisk server](https://www.asterisk.org/).

**Temperature control on the CPU is managed by the chip internally with auto shut down. Why bother to control it yourself?**

To maintain the flow of the pipeline, preserve the state of variables and to increase the longevity of the chip. It's my understanding that the internal protection is there to prevent complete failure, not to ensure longevity.

**Why don't you have a pure Julia version of these utilties?**

Right now the results come back quite fast, so there is no incentive to convert to pure Julia versions. I would have to spend time becoming familiar with the low level access to information; time is valuable and things have to take their turn in the priorities of life.

**I use Windows. How can I get the equivalent of `free` and `sensors` in my OS?**

I have not used Windows in a long time, so I cannot give much of an answer here, except to point to various discussions online which assess the merits of Windows alternatives to Linux `free` and `sensors` such as [here](https://superuser.com/questions/315195/is-there-a-command-to-find-out-the-available-memory-in-windows) and [here](https://superuser.com/questions/395434/how-can-i-check-the-temperature-of-my-cpu-in-windows).

**There are lots of temperature monitoring packages available specifically for CPUs. You could just run one of those separately from the machine learning pipeline that would then run faster.**

Right, but then I would not have access to control of the machine learning to slow down the processing or introduce a wait state and let the machine cool down.

**Hot CPUs are usually a result of accumulated dirt in boxes and fans and impeded air flow due to poor wire management and inefficient fans.**

Right, continuous monitoring of internal temperatures gives an incentive to make sure that boxen are clean. It is reported that re-seating processors with fresh thermal paste can also help. In wintertime here I can just open a window to let in cold air and that also helps a lot. Situating the learning box in a cold room in the house means I don't have to wear a tuque and overcoat while the programme runs.

**Why is memory monitoring even a concern? I never had any problem.**

It can be very instructive to use a memory monitoring package to watch where the demand for memory occurs. In my experience data matrix manipulation to prepare the data for learning is not an issue, perhaps due to intelligent tiling of matrices, but when tuning batches and batch sizes memory consumption ramps up very quickly. The goal is to let it do that, to use memory fully, but not allow it to spill over into the swap space. The more hidden layers we add into our learning pipelines the more critical this becomes.

**How do you arrive at your thresholds? Why 20% free memory, why a percentage and not an absolute number of GB, and why 70C for CPU temperature?**

Memory cutoff will depend on the project and your physical memory available. Temperature is a personal choice.

**Using such protection is all fine and well but lots of these checks can still slow the process of learning.**

True - but as the learning pipeline is refined and the operator becomes more confident that the process will not require frequent checking many of the checks necessary early in the management process can be removed.

**I can't make out the colours on your video. What standards are you using for accessibility?**

Colour contrast suggested by site http://web-accessibility.carnegiemuseums.org/design/color/
