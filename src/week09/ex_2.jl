using JuMP
using Gurobi

model = Model(Gurobi.Optimizer)
show(model)

@variable(model, x1 >= 0, Int)
@variable(model, x2 >= 0, Int)

@objective(model, Max, 3x1 + 6x2)

@constraint(model, c1, 7x1 + 3x2 <= 40)
print(model)

optimize!(model)
println("
    x1: $(value(x1)), 
    x2: $(value(x2)),
")
