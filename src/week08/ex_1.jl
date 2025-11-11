using JuMP
using Gurobi

model = Model(Gurobi.Optimizer)
show(model)

@variable(model, x >= 0, Int)
@variable(model, y >= 0, Int)

@objective(model, Max, 6x - y)

@constraint(model, c1, 8x - 2y <= 15)
@constraint(model, c2, 4x + 5y <= 36)
print(model)

optimize!(model)
println("
    x: $(value(x)), 
    y: $(value(y)),
")

# Linear relaxation (remove integrality constraints)
undo = relax_integrality(model)
set_optimizer(model, Gurobi.Optimizer)
optimize!(model)
println("
    x: $(value(x)), 
    y: $(value(y)),
")
