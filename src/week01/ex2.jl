using JuMP
using HiGHS

model = Model(HiGHS.Optimizer)
show(model)

@variable(model, x[1:3] >= 0, Int)

@constraint(model, c1, 3x[1] + 4x[2] + 1x[3] <= 27)
@constraint(model, c2, 6x[1] + 2x[2] + 5x[3] <= 63)
@constraint(model, c3, 1x[1] + 3x[2] + 4x[3] <= 38)

@objective(model, Max, 5x[1] + 6x[2] + 5x[3])

print(model)

optimize!(model)
println("x1: $(value(x[1])), x2: $(value(x[2])), x3: $(value(x[3]))")
