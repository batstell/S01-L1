io.write("Digite o valor de M: ")
local M = tonumber(io.read())

io.write("Digite o valor de N: ")
local N = tonumber(io.read())

io.write("Digite o valor de X (para encontrar os múltiplos): ")
local X = tonumber(io.read())

print("\nMúltiplos de " .. X .. " no intervalo de " .. M .. " até " .. N .. ":")

for i = M, N do
    if i % X == 0 then
        print(i)
    end
end
