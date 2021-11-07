export tester

function tester(model,claim,actions,K)
  picked = []
  for i = 1:K
    q_max = nothing
    ind = nothing
    for j = 1 :length(actions)
      q = model.(picked,claim,actions[j])
      if q_max == nothing || q_max < q
        q_max = q
        ind = j
      end
    end
    a = popat!(actions,ind)
    push!(picked,a)
  end
  return picked
end