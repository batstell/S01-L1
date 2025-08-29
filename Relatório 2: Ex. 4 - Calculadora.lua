function calculadora(a, b, operador)
    if operador == "+" then
        return a + b
    elseif operador == "-" then
        return a - b
    elseif operador == "*" then
        return a * b
    elseif operador == "/" then
        if b == 0 then
            return "Erro: divisão por zero!"
        else
            return a / b
        end
    else
        return "Erro: operador inválido!"
    end
end

io.write("Digite o primeiro número: ")
local num1 = tonumber(io.read())

io.write("Digite o segundo número: ")
local num2 = tonumber(io.read())

io.write("Digite o operador (+, -, * ou /): ")
local op = io.read()
