-- Definição do tipo Servico
data Servico = Servico {
    nomeServico :: String,
    tipoServico :: String,
    precoBase :: Double
} deriving (Show, Eq)

-- Definição do tipo Status do Atendimento
data StatusAtendimento = EmAndamento | Finalizado | Cancelado deriving (Show, Eq)

-- Definição do tipo Atendimento
data Atendimento = Atendimento {
    servicos :: [Servico],
    statusAtendimento :: StatusAtendimento
} deriving (Show, Eq)

-- Função que calcula o bônus espiritual
-- Soma todos os preços dos serviços
-- Aplica um bônus de 25% se houver mais de 3 serviços
-- Aplica um desconto de 10% se o total ultrapassar 500
bonusEspiritual :: [Servico] -> Double
bonusEspiritual servicos
    | totalServicos > 500 = totalComBonus * 0.90  -- Desconto de 10%
    | length servicos > 3 = totalComBonus
    | otherwise = totalServicos
    where
        totalServicos = sum [precoBase s | s <- servicos]
        totalComBonus = totalServicos * 1.25  -- Bônus de 25%

-- Função que calcula o valor final do atendimento
-- Usa guards para aplicar as regras e zerar o valor se cancelado
valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento atendimento
    | statusAtendimento atendimento == Cancelado = 0.0
    | otherwise = bonusEspiritual (servicos atendimento)

-- Função que retorna a descrição do primeiro serviço
-- Retorna o nome e tipo do primeiro serviço ou mensagem se não houver
descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico atendimento
    | null (servicos atendimento) = "Nenhum serviço contratado"
    | otherwise = nomeServico primeiroServ ++ " (" ++ tipoServico primeiroServ ++ ")"
    where
        primeiroServ = head (servicos atendimento)

-- Exemplos de uso:
main :: IO ()
main = do
    -- Criando alguns serviços
    let banhoHerbal = Servico "Banho de Ervas Purificador" "Banho" 150.0
    let banhoOuro = Servico "Banho de Ouro Espiritual" "Banho" 200.0
    let massagemRelax = Servico "Massagem Relaxante" "Massagem" 120.0
    let massagemPedras = Servico "Massagem com Pedras Quentes" "Massagem" 180.0
    let banqueteImperial = Servico "Banquete Imperial" "Banquete" 300.0
    let banqueteDivino = Servico "Banquete Divino" "Banquete" 250.0
    
    -- Criando atendimentos de exemplo
    let atend1 = Atendimento [banhoHerbal, massagemRelax] EmAndamento
    let atend2 = Atendimento [banhoOuro, massagemPedras, banqueteImperial, banhoHerbal] Finalizado
    let atend3 = Atendimento [banhoOuro, massagemPedras, banqueteImperial] Cancelado
    let atend4 = Atendimento [banhoOuro, banhoHerbal, massagemRelax, massagemPedras, banqueteDivino] Finalizado
    
    -- Testando as funções
    putStrLn "=== Casa de Banhos do Mundo Espiritual - Yubaba ==="
    
    putStrLn "\n--- Atendimento 1 (Em Andamento - 2 serviços) ---"
    putStrLn $ "Status: " ++ show (statusAtendimento atend1)
    putStrLn "Serviços contratados:"
    mapM_ (\s -> putStrLn $ "  • " ++ nomeServico s ++ " (" ++ tipoServico s ++ "): R$" ++ show (precoBase s)) (servicos atend1)
    putStrLn $ "Primeiro serviço: " ++ descricaoPrimeiroServico atend1
    let total1 = sum [precoBase s | s <- servicos atend1]
    putStrLn $ "Subtotal: R$" ++ show total1
    putStrLn "Bônus: Nenhum (menos de 3 serviços)"
    putStrLn $ "Valor Final: R$" ++ show (valorFinalAtendimento atend1)
    
    putStrLn "\n--- Atendimento 2 (Finalizado - 4 serviços) ---"
    putStrLn $ "Status: " ++ show (statusAtendimento atend2)
    putStrLn "Serviços contratados:"
    mapM_ (\s -> putStrLn $ "  • " ++ nomeServico s ++ " (" ++ tipoServico s ++ "): R$" ++ show (precoBase s)) (servicos atend2)
    putStrLn $ "Primeiro serviço: " ++ descricaoPrimeiroServico atend2
    let total2 = sum [precoBase s | s <- servicos atend2]
    putStrLn $ "Subtotal: R$" ++ show total2
    putStrLn $ "Bônus Espiritual (25%): R$" ++ show (total2 * 0.25)
    putStrLn $ "Total com bônus: R$" ++ show (total2 * 1.25)
    putStrLn $ "Desconto (10% por ultrapassar R$500): R$" ++ show (total2 * 1.25 * 0.10)
    putStrLn $ "Valor Final: R$" ++ show (valorFinalAtendimento atend2)
    
    putStrLn "\n--- Atendimento 3 (Cancelado - 3 serviços) ---"
    putStrLn $ "Status: " ++ show (statusAtendimento atend3)
    putStrLn "Serviços que seriam contratados:"
    mapM_ (\s -> putStrLn $ "  • " ++ nomeServico s ++ " (" ++ tipoServico s ++ "): R$" ++ show (precoBase s)) (servicos atend3)
    putStrLn $ "Primeiro serviço: " ++ descricaoPrimeiroServico atend3
    putStrLn $ "Valor Final: R$" ++ show (valorFinalAtendimento atend3)
    putStrLn "(Atendimento cancelado - sem custos)"
    
    putStrLn "\n--- Atendimento 4 (Finalizado - 5 serviços) ---"
    putStrLn $ "Status: " ++ show (statusAtendimento atend4)
    putStrLn "Serviços contratados:"
    mapM_ (\s -> putStrLn $ "  • " ++ nomeServico s ++ " (" ++ tipoServico s ++ "): R$" ++ show (precoBase s)) (servicos atend4)
    putStrLn $ "Primeiro serviço: " ++ descricaoPrimeiroServico atend4
    let total4 = sum [precoBase s | s <- servicos atend4]
    putStrLn $ "Subtotal: R$" ++ show total4
    putStrLn $ "Bônus Espiritual (25%): R$" ++ show (total4 * 0.25)
    putStrLn $ "Total com bônus: R$" ++ show (total4 * 1.25)
    putStrLn $ "Desconto (10% por ultrapassar R$500): R$" ++ show (total4 * 1.25 * 0.10)
    putStrLn $ "Valor Final: R$" ++ show (valorFinalAtendimento atend4)
    
    putStrLn "\n=== Resumo das Regras ==="
    putStrLn "• Bônus de 25% se houver mais de 3 serviços"
    putStrLn "• Desconto de 10% se o total ultrapassar R$500"
    putStrLn "• Atendimentos cancelados têm valor zerado"
    putStrLn "• Primeiro serviço mostra nome e tipo"