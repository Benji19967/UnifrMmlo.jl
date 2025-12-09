using JuMP
using Gurobi

model = Model(Gurobi.Optimizer)
show(model)

@variable(model, x1 >= 0, Int)
@variable(model, x2 >= 0, Int)
@variable(model, x3 >= 0, Int)
@variable(model, x4 >= 0, Int)

@variable(model, lambda == 6)

# @objective(model, Max, 16x1 + 10x2 +4x4)

# Langrangian relaxation of constraint c3
@objective(model, Max, 16x1 + 10x2 +4x4 + lambda*(10 - 8x1 - 2x2 - x3 - 4x4))

@constraint(model, c1, x1 + x2 <= 1)
@constraint(model, c2, x3 + x4 <= 1)
# @constraint(model, c3, 8x1 + 2x2 + x3 + 4x4 <= 10)
print(model)

optimize!(model)
println("
    x1: $(value(x1)), 
    x2: $(value(x2)),
    x3: $(value(x3)),
    x4: $(value(x4)),
")
