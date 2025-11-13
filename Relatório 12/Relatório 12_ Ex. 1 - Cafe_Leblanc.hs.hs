-- Definição do tipo Bebida
data Bebida = Bebida {
    nome :: String,
    tipo :: String,
    preco :: Double
} deriving (Show, Eq)

-- Definição do tipo Status do Pedido
data Status = Aberto | Entregue | Cancelado deriving (Show, Eq)

-- Definição do tipo Pedido
data Pedido = Pedido {
    bebidas :: [Bebida],
    status :: Status
} deriving (Show, Eq)

-- Função que calcula o valor total do pedido
-- Adiciona taxa de serviço de R$5.00, exceto se o pedido estiver Cancelado
valorTotalPedido :: Pedido -> Double
valorTotalPedido pedido
    | status pedido == Cancelado = 0.0
    | otherwise = somaPrecos + 5.0
    where
        somaPrecos = sum [preco b | b <- bebidas pedido]

-- Função que retorna o nome da primeira bebida do pedido
-- Retorna mensagem caso a lista esteja vazia
primeiraBebida :: Pedido -> String
primeiraBebida pedido
    | null (bebidas pedido) = "Lista de bebidas vazia"
    | otherwise = nome (head (bebidas pedido))

-- Exemplos de uso:
main :: IO ()
main = do
    -- Criando algumas bebidas
    let cafe = Bebida "Café Expresso" "Café" 8.0
    let cha = Bebida "Chá Verde" "Chá" 6.0
    let suco = Bebida "Suco de Laranja" "Suco" 7.5
    
    -- Criando pedidos de exemplo
    let pedido1 = Pedido [cafe, cha] Aberto
    let pedido2 = Pedido [suco, cafe, cha] Entregue
    let pedido3 = Pedido [cafe] Cancelado
    let pedido4 = Pedido [] Aberto
    
    -- Testando as funções
    putStrLn "=== Sistema Café Leblanc ==="
    putStrLn "\n--- Pedido 1 (Aberto) ---"
    print pedido1
    putStrLn $ "Primeira bebida: " ++ primeiraBebida pedido1
    putStrLn $ "Valor total: R$" ++ show (valorTotalPedido pedido1)
    
    putStrLn "\n--- Pedido 2 (Entregue) ---"
    print pedido2
    putStrLn $ "Primeira bebida: " ++ primeiraBebida pedido2
    putStrLn $ "Valor total: R$" ++ show (valorTotalPedido pedido2)
    
    putStrLn "\n--- Pedido 3 (Cancelado) ---"
    print pedido3
    putStrLn $ "Primeira bebida: " ++ primeiraBebida pedido3
    putStrLn $ "Valor total: R$" ++ show (valorTotalPedido pedido3)
    
    putStrLn "\n--- Pedido 4 (Vazio) ---"
    print pedido4
    putStrLn $ "Primeira bebida: " ++ primeiraBebida pedido4
    putStrLn $ "Valor total: R$" ++ show (valorTotalPedido pedido4)