# test the three functions in utilities
using Test
include("utilities.jl")
@test checkmem() > 0
@test checkcpu() > 0
@test success(callout("process finished"))
