using JuMP
using HiGHS

model = Model(HiGHS.Optimizer)
show(model)

@variable(model, b >= 0)
@variable(model, r >= 0)
@variable(model, l >= 0)
@variable(model, p >= 0)

@constraint(model, c1, p <= 0.5b)
@constraint(model, c2, r <= l)
@constraint(model, c3, p <= 0.2(b + r + l + p))
@constraint(model, c4, b + r + l + p <= 1_000_000)

@objective(model, Max, 1.06b + 1.10r + 1.08l + 1.13p)

print(model)

optimize!(model)
println("
    b: $(value(b)), 
    r: $(value(r)),
    l: $(value(l)),
    p: $(value(p)),
")
