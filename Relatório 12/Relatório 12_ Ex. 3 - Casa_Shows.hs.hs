-- Definição do tipo Banda
data Banda = Banda {
    nomeBanda :: String,
    genero :: String,
    cache :: Double
} deriving (Show, Eq)

-- Definição do tipo Status do Evento
data StatusEvento = Ativo | Encerrado | Cancelado deriving (Show, Eq)

-- Definição do tipo Evento
data Evento = Evento {
    bandas :: [Banda],
    statusEvento :: StatusEvento
} deriving (Show, Eq)

-- Função que calcula o custo total do evento
-- Soma todos os cachês, adiciona taxa de produção de 20% sobre o total
-- Retorna 0.0 se o evento foi Cancelado
custoTotalEvento :: Evento -> Double
custoTotalEvento evento
    | statusEvento evento == Cancelado = 0.0
    | otherwise = totalCaches + (totalCaches * 0.20)
    where
        totalCaches = sum [cache b | b <- bandas evento]

-- Função que exibe o nome da banda que irá abrir a casa
-- Retorna o nome da primeira banda ou mensagem se não houver nenhuma
bandaAbertura :: Evento -> String
bandaAbertura evento
    | null (bandas evento) = "Nenhuma banda confirmada"
    | otherwise = nomeBanda (head (bandas evento))

-- Função que exibe o nome da banda que tocará por último (fechando a noite)
-- Retorna o nome da última banda ou mensagem se não houver nenhuma
bandaFechamento :: Evento -> String
bandaFechamento evento
    | null (bandas evento) = "Nenhuma banda confirmada"
    | otherwise = nomeBanda (last (bandas evento))

-- Exemplos de uso:
main :: IO ()
main = do
    -- Criando algumas bandas
    let banda1 = Banda "The Rockers" "Rock" 5000.0
    let banda2 = Banda "Jazz Masters" "Jazz" 4000.0
    let banda3 = Banda "Eletronic Beats" "Eletrônica" 6000.0
    let banda4 = Banda "Samba da Vibe" "Samba" 3500.0
    let banda5 = Banda "Metal Force" "Metal" 4500.0
    
    -- Criando eventos de exemplo
    let eventoAtivo = Evento [banda1, banda2, banda3] Ativo
    let eventoEncerrado = Evento [banda4, banda5] Encerrado
    let eventoCancelado = Evento [banda1, banda3] Cancelado
    
    -- Testando as funções
    putStrLn "=== Sistema de Gerenciamento - Casa de Shows ==="
    
    putStrLn "\n--- Evento 1 (ATIVO) ---"
    putStrLn $ "Status: " ++ show (statusEvento eventoAtivo)
    putStrLn "Bandas confirmadas:"
    mapM_ (\b -> putStrLn $ "  • " ++ nomeBanda b ++ " (" ++ genero b ++ ") - R$" ++ show (cache b)) (bandas eventoAtivo)
    putStrLn $ "Banda de Abertura: " ++ bandaAbertura eventoAtivo
    putStrLn $ "Banda de Fechamento: " ++ bandaFechamento eventoAtivo
    let totalCache1 = sum [cache b | b <- bandas eventoAtivo]
    putStrLn $ "Total de cachês: R$" ++ show totalCache1
    putStrLn $ "Taxa de produção (20%): R$" ++ show (totalCache1 * 0.20)
    putStrLn $ "Custo Total do Evento: R$" ++ show (custoTotalEvento eventoAtivo)
    
    putStrLn "\n--- Evento 2 (ENCERRADO) ---"
    putStrLn $ "Status: " ++ show (statusEvento eventoEncerrado)
    putStrLn "Bandas que tocaram:"
    mapM_ (\b -> putStrLn $ "  • " ++ nomeBanda b ++ " (" ++ genero b ++ ") - R$" ++ show (cache b)) (bandas eventoEncerrado)
    putStrLn $ "Banda de Abertura: " ++ bandaAbertura eventoEncerrado
    putStrLn $ "Banda de Fechamento: " ++ bandaFechamento eventoEncerrado
    let totalCache2 = sum [cache b | b <- bandas eventoEncerrado]
    putStrLn $ "Total de cachês: R$" ++ show totalCache2
    putStrLn $ "Taxa de produção (20%): R$" ++ show (totalCache2 * 0.20)
    putStrLn $ "Custo Total do Evento: R$" ++ show (custoTotalEvento eventoEncerrado)
    
    putStrLn "\n--- Evento 3 (CANCELADO) ---"
    putStrLn $ "Status: " ++ show (statusEvento eventoCancelado)
    putStrLn "Bandas que seriam confirmadas:"
    mapM_ (\b -> putStrLn $ "  • " ++ nomeBanda b ++ " (" ++ genero b ++ ") - R$" ++ show (cache b)) (bandas eventoCancelado)
    putStrLn $ "Banda de Abertura: " ++ bandaAbertura eventoCancelado
    putStrLn $ "Banda de Fechamento: " ++ bandaFechamento eventoCancelado
    putStrLn $ "Custo Total do Evento: R$" ++ show (custoTotalEvento eventoCancelado)
    putStrLn "(Evento cancelado - sem custos)"
    
    putStrLn "\n=== Resumo das Regras ==="
    putStrLn "• Custo Total = Soma dos cachês + 20% de taxa de produção"
    putStrLn "• Eventos cancelados têm custo zero"
    putStrLn "• Primeira banda da lista = Banda de Abertura"
    putStrLn "• Última banda da lista = Banda de Fechamento"