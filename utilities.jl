"""
	callout()
	
	receives a String message
	produces a sound representation of the message through speakers
"""
function callout(mess::String)
	# padsp is necessary for me to play through pulseaudio
	# ignorestatus is useful since often flite performs the audio but does not exit cleanly with 0
	cmd = ignorestatus(`padsp flite "$mess"`)
	run(cmd);
end
#
"""
	checkmem()

	checks memory remaining as percentage (headroom)
	returns decimal fraction in range 0.0:1.0
"""
function checkmem()
	cmd = `free -b`
	lins = readlines(cmd)
	lina = split(lins[2]," ",keepempty=false)
	return parse(Int,lina[7])/parse(Int,lina[2])
end
"""
	checkcpu()
	
	reports back the temperature of the CPU
"""
function checkcpu()
	# function to check state of cpu temperature
	cmd = `sensors`
	# alternatively get the json output from sensors
	sens = readlines(cmd)
	cs = sens[contains.(sens,"Core")]
	ts = Vector{Real}()
	R = r"\d+\.\d+"
	for i in 1:length(cs)
		f = findall(R,cs[i])
		t = cs[i][f[1]]
		push!(ts,parse(Float32,t))
	end
	# return the average of the core temperatures
	return sum(ts)/4
end
