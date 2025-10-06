using JuMP
using HiGHS

model = Model(HiGHS.Optimizer)
show(model)

@variable(model, Ca >= 0)
@variable(model, Cu >= 0)
@variable(model, WC >= 0)

@constraint(model, c1, 35Ca + 0.5Cu + 0.5WC >= 0.5)
@constraint(model, c2, 60Ca + 300Cu + 10WC >= 15)
@constraint(model, c3, 30Ca + 20Cu + 10WC >= 4)

@objective(model, Min, 0.75Ca + 0.15Cu + 0.5WC)


print(model)

optimize!(model)
println("
    Ca: $(value(Ca)), 
    Cu: $(value(Cu)),
    WC: $(value(WC)),
")
