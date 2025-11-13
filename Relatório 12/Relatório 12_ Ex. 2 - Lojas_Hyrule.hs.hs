-- Definição do tipo Item
data Item = Item {
    nome :: String,
    categoria :: String,
    preco :: Double
} deriving (Show, Eq)

-- Definição do tipo CompraZelda
data CompraZelda = CompraZelda {
    itens :: [Item]
} deriving (Show, Eq)

-- Função que calcula o desconto
-- Retorna 10% de desconto se o total dos itens for acima de 200
calculaDesconto :: [Item] -> Double
calculaDesconto itens
    | totalItens > 200 = totalItens * 0.10
    | otherwise = 0.0
    where
        totalItens = sum [preco i | i <- itens]

-- Função que calcula o valor final da compra
-- Aplica o desconto quando apropriado e adiciona frete fixo de 15.0
-- quando o total for menor ou igual a 200
valorFinal :: CompraZelda -> Double
valorFinal compra
    | totalItens > 200 = totalItens - desconto
    | otherwise = totalItens + 15.0
    where
        totalItens = sum [preco i | i <- itens compra]
        desconto = calculaDesconto (itens compra)

-- Exemplos de uso:
main :: IO ()
main = do
    -- Criando alguns itens
    let espadaMestra = Item "Espada Mestra" "Arma" 150.0
    let escudoHylian = Item "Escudo Hylian" "Equipamento" 80.0
    let arcoFloresta = Item "Arco da Floresta" "Arma" 120.0
    let pocaoVida = Item "Poção de Vida" "Poção" 25.0
    let pocaoMagia = Item "Poção de Magia" "Poção" 30.0
    let armaduraZora = Item "Armadura Zora" "Equipamento" 200.0
    
    -- Criando compras de exemplo
    let compra1 = CompraZelda [espadaMestra, escudoHylian, arcoFloresta]  -- Total > 200
    let compra2 = CompraZelda [pocaoVida, pocaoMagia]                     -- Total <= 200
    let compra3 = CompraZelda [armaduraZora, pocaoVida]                   -- Total > 200
    let compra4 = CompraZelda [escudoHylian, pocaoVida, pocaoMagia]       -- Total <= 200
    
    -- Testando as funções
    putStrLn "=== Sistema de Compras - Lojas de Hyrule ==="
    
    putStrLn "\n--- Compra 1 (Total > 200) ---"
    putStrLn "Itens:"
    mapM_ (\i -> putStrLn $ "  - " ++ nome i ++ " (" ++ categoria i ++ "): R$" ++ show (preco i)) (itens compra1)
    let total1 = sum [preco i | i <- itens compra1]
    putStrLn $ "Subtotal: R$" ++ show total1
    putStrLn $ "Desconto (10%): R$" ++ show (calculaDesconto (itens compra1))
    putStrLn $ "Valor Final: R$" ++ show (valorFinal compra1)
    
    putStrLn "\n--- Compra 2 (Total <= 200) ---"
    putStrLn "Itens:"
    mapM_ (\i -> putStrLn $ "  - " ++ nome i ++ " (" ++ categoria i ++ "): R$" ++ show (preco i)) (itens compra2)
    let total2 = sum [preco i | i <- itens compra2]
    putStrLn $ "Subtotal: R$" ++ show total2
    putStrLn $ "Frete: R$15.0"
    putStrLn $ "Valor Final: R$" ++ show (valorFinal compra2)
    
    putStrLn "\n--- Compra 3 (Total > 200) ---"
    putStrLn "Itens:"
    mapM_ (\i -> putStrLn $ "  - " ++ nome i ++ " (" ++ categoria i ++ "): R$" ++ show (preco i)) (itens compra3)
    let total3 = sum [preco i | i <- itens compra3]
    putStrLn $ "Subtotal: R$" ++ show total3
    putStrLn $ "Desconto (10%): R$" ++ show (calculaDesconto (itens compra3))
    putStrLn $ "Valor Final: R$" ++ show (valorFinal compra3)
    
    putStrLn "\n--- Compra 4 (Total <= 200) ---"
    putStrLn "Itens:"
    mapM_ (\i -> putStrLn $ "  - " ++ nome i ++ " (" ++ categoria i ++ "): R$" ++ show (preco i)) (itens compra4)
    let total4 = sum [preco i | i <- itens compra4]
    putStrLn $ "Subtotal: R$" ++ show total4
    putStrLn $ "Frete: R$15.0"
    putStrLn $ "Valor Final: R$" ++ show (valorFinal compra4)
    
    putStrLn "\n=== Resumo das Regras ==="
    putStrLn "• Total > R$200: Desconto de 10%, sem frete"
    putStrLn "• Total <= R$200: Sem desconto, frete de R$15"