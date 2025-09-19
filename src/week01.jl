using JuMP
using HiGHS

ex0_model = Model(HiGHS.Optimizer)
show(ex0_model)

@variable(ex0_model, c >=0, Int)
@variable(ex0_model, t >=0, Int)

@constraint(ex0_model, c1, 2t + 1c <= 6)
@constraint(ex0_model, c2, 2t + 2c <= 9)

@objective(ex0_model, Max, 8t + 5c)

print(ex0_model)

optimize!(ex0_model)
println("c: $(value(c)), t: $(value(t))")
