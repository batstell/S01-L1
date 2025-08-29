function maiorValor(tabela)
    local maior = tabela[1]
    for i = 2, #tabela do
        if tabela[i] > maior then
            maior = tabela[i]
        end
    end
    return maior
end

io.write("Quantos números deseja inserir? ")
local n = tonumber(io.read())

local numeros = {}

for i = 1, n do
    io.write("Digite o número " .. i .. ": ")
    numeros[i] = tonumber(io.read())
end

print("O maior valor da tabela é: " .. maiorValor(numeros))
