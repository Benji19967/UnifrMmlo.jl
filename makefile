install:
	julia --project=. -e 'using Pkg; Pkg.instantiate()'

week01_ex0:
	julia --project src/week01/ex0.jl
