function filtrarPares(tabela)
    local pares = {}
    for i = 1, #tabela do
        if tabela[i] % 2 == 0 then
            table.insert(pares, tabela[i])
        end
    end
    return pares
end

io.write("Quantos números deseja inserir? ")
local n = tonumber(io.read())

local numeros = {}
for i = 1, n do
    io.write("Digite o número " .. i .. ": ")
    numeros[i] = tonumber(io.read())
end

local pares = filtrarPares(numeros)

print("Os números pares são:")
for i = 1, #pares do
    io.write(pares[i] .. " ")
end
print()
