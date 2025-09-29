using JuMP
using HiGHS

model = Model(HiGHS.Optimizer)
show(model)

@variable(model, b)
@variable(model, r)
@variable(model, l)
@variable(model, p)

# Slack variables
@variable(model, u >= 0)
@variable(model, v >= 0)
@variable(model, x >= 0)
@variable(model, y >= 0)

@constraint(model, c1, p - 0.5b + u == 0)
@constraint(model, c2, r - l + v == 0)
@constraint(model, c3, p - 200_000 + x == 0)
@constraint(model, c4, b + r + l + p - 1_000_000 + y == 0)

@objective(model, Min, -(1.08b + 1.10r + 1.08l + 1.13p))


print(model)

optimize!(model)
println("
    b: $(value(b)), 
    r: $(value(r)),
    l: $(value(l)),
    p: $(value(p)),
")
