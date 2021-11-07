export readData, readData_tsv
using JSON
function readData(filename)
    io = open(filename,"r")
    s = readlines(io)
    return JSON.parse.(s);
end
function readData_tsv(filename)
    io = open(filename,"r")
    s = readlines(io)
    labels = split(s[1],"\t")
    indices = labels .!= ""
    labels = labels[indices]
    l = []
    for i = 2:length(s)
       line = split(s[i],"\t")[indices]
       push!(l,Dict(zip(labels,line))) 
    end
    return l;
end