using Flux
# set up data
...
X = imgs
Y = onehotbatch(labels, 0:4)
...
if checkmem() < 0.2
	@error("Memory free is less than 20%")
	#break
end
...
m = Chain(...)
function loss(...)
  ...
end
dataset = Flux.Data.DataLoader(X, Y, batchsize=32, shuffle=true)
...
# callback function
evalcb = () -> 
begin
	@show(loss(X, Y)),
	if loss(X,Y) < 0.75
		callout("early stop")
		Flux.stop()
	end
	# cpu temperature
	cput = checkcpu()
  # in this example temperature of 70 C is the cutoff
	while cput > 70
		@warn("watching CPU... ($cput)")
    callout("CPU is hot")
    # rest the CPU for 60 seconds
		sleep(60)
		cput = checkcpu()
	end
end # callback

Flux.@epochs 7 Flux.train!(loss, params(m), dataset, opt, cb = throttle(evalcb,1))

callout("Training done")
