export BaselineModel
struct BaselineModel
end

# Predicting Q value
(m::BaselineModel)(state,action) = rand();

#Calculating TD Error
(m::BaselineModel)(transition,reward::Number) = -reward * rand();

#Predicting Q value
(m::BaselineModel)(picked,claim,action) = m([picked;claim],action);
