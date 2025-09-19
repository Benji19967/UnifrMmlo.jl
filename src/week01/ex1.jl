using JuMP
using HiGHS

model = Model(HiGHS.Optimizer)
show(model)

@variable(model, x[1:2] >= 0, Int)

@constraint(model, c1, 2x[1] + 4x[2] <= 26)
@constraint(model, c2, 4x[1] + 1x[2] <= 17)

@objective(model, Max, 5x[1] + 2x[2])

print(model)

optimize!(model)
println("x1: $(value(x[1])), x2: $(value(x[2]))")
