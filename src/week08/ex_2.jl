using JuMP
using Gurobi

model = Model(Gurobi.Optimizer)
show(model)

# Perfect formulation of ex_1: convex hull of MILP == feasible region.

@variable(model, x >= 0)
@variable(model, y >= 0)

@objective(model, Max, 6x - y)

@constraint(model, c1, y + x <= 7)
@constraint(model, c2, x <= 2)
@constraint(model, c3, y - x >= -1)
print(model)

optimize!(model)
println("
    x: $(value(x)), 
    y: $(value(y)),
")
