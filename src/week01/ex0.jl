using JuMP
using HiGHS

model = Model(HiGHS.Optimizer)
show(model)

@variable(model, c >=0, Int)
@variable(model, t >=0, Int)

@constraint(model, c1, 2t + 1c <= 6)
@constraint(model, c2, 2t + 2c <= 9)

@objective(model, Max, 8t + 5c)

print(model)

optimize!(model)
println("c: $(value(c)), t: $(value(t))")
