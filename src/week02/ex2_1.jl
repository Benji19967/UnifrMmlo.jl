using JuMP
using HiGHS

model = Model(HiGHS.Optimizer)
show(model)

@variable(model, b)
@variable(model, r)
@variable(model, l)
@variable(model, p)

@constraint(model, c1, p <= 0.5b)
@constraint(model, c2, r <= l)
@constraint(model, c3, p <= 200_000)
@constraint(model, c4, b + r + l + p == 1_000_000)

@objective(model, Max, 1.08b + 1.10r + 1.08l + 1.13p)

print(model)

optimize!(model)
println("
    b: $(value(b)), 
    r: $(value(r)),
    l: $(value(l)),
    p: $(value(p)),
")
