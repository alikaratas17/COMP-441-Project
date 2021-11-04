export readData
using JSON
function readData(filename)
    io = open(filename,"r")
    s = readlines(io)
    return JSON.parse.(s);
end