;; EXERCÍCIO 3: A LOJA DE IWAI

;; 1. Estrutura e Catálogo

;; Definição da estrutura item
(defstruct item
  "Estrutura para representar um item mágico da loja"
  nome
  tipo          ; 'arma, 'pocao, ou 'artefato
  preco
  forca-magica)

;; Catálogo inicial com diferentes tipos de itens
(defparameter *catalogo*
  (list
   ;; Armas
   (make-item :nome "Espada Flamejante"
              :tipo 'arma
              :preco 1000
              :forca-magica 85)
   
   (make-item :nome "Arco Élfico"
              :tipo 'arma
              :preco 800
              :forca-magica 75)
   
   (make-item :nome "Cajado Arcano"
              :tipo 'arma
              :preco 1200
              :forca-magica 95)
   
   ;; Poções
   (make-item :nome "Poção de Cura"
              :tipo 'pocao
              :preco 50
              :forca-magica 30)
   
   (make-item :nome "Elixir de Mana"
              :tipo 'pocao
              :preco 80
              :forca-magica 40)
   
   ;; Artefatos
   (make-item :nome "Amuleto do Dragão"
              :tipo 'artefato
              :preco 2000
              :forca-magica 100)
   
   (make-item :nome "Anel da Invisibilidade"
              :tipo 'artefato
              :preco 1500
              :forca-magica 60))
  "Catálogo de itens da loja de Iwai")

;; 2. Funções de Transformação

;; Função pura: adiciona-imposto
;; Aumenta o preço em 15%
(defun adiciona-imposto (preco)
  "Aumenta o preço em 15%"
  (* preco 1.15))

;; Função pura: bonus-maldicao
;; Retorna força * 1.5 se força-magica > 80, senão retorna força original
(defun bonus-maldicao (forca)
  "Aplica bônus de 1.5x se força-mágica > 80"
  (if (> forca 80)
      (* forca 1.5)
      forca))

;; 3. Função processa-venda

(defun processa-venda (catalogo)
  "Processa a venda executando filtro e transformações nas armas"
  
  ;; a. Filtra: Mantém apenas os itens do tipo Arma
  (let* ((apenas-armas (remove-if-not (lambda (item)
                                        (eq (item-tipo item) 'arma))
                                      catalogo))
         
         ;; b. Transforma (1): Mapear aumentando preço com adiciona-imposto
         (armas-com-imposto (mapcar (lambda (arma)
                                      (make-item :nome (item-nome arma)
                                                 :tipo (item-tipo arma)
                                                 :preco (adiciona-imposto (item-preco arma))
                                                 :forca-magica (item-forca-magica arma)))
                                    apenas-armas))
         
         ;; c. Transforma (2): Mapear retornando nome e nova força-mágica com bônus
         (resultado-final (mapcar (lambda (arma)
                                    (list :nome (item-nome arma)
                                          :preco-com-imposto (item-preco arma)
                                          :forca-magica-bonus (bonus-maldicao (item-forca-magica arma))))
                                  armas-com-imposto)))
    
    resultado-final))

;; Funções auxiliares para exibição

(defun exibe-item (item)
  "Exibe as informações de um item de forma formatada"
  (format t "  Nome: ~A~%" (item-nome item))
  (format t "  Tipo: ~A~%" (item-tipo item))
  (format t "  Preço: ~A moedas~%" (item-preco item))
  (format t "  Força Mágica: ~A~%~%" (item-forca-magica item)))

(defun exibe-resultado-venda (resultado)
  "Exibe o resultado processado de uma venda"
  (format t "  Nome: ~A~%" (getf resultado :nome))
  (format t "  Preço com Imposto: ~,2F moedas~%" (getf resultado :preco-com-imposto))
  (format t "  Força Mágica (com bônus): ~,2F~%~%" (getf resultado :forca-magica-bonus)))

;; Função de testes

(defun testes-loja ()
  "Executa testes do sistema da loja de Iwai"
  (format t "~%========================================~%")
  (format t "LOJA DE IWAI - Sistema de Vendas~%")
  (format t "========================================~%~%")
  
  ;; Exibe catálogo completo
  (format t "=== CATÁLOGO COMPLETO ===~%")
  (format t "Total de itens: ~A~%~%" (length *catalogo*))
  (dolist (item *catalogo*)
    (exibe-item item))
  
  ;; Teste das funções de transformação isoladas
  (format t "~%=== TESTE: Funções de Transformação ===~%")
  (format t "adiciona-imposto(1000) = ~A~%" (adiciona-imposto 1000))
  (format t "bonus-maldicao(85) = ~A~%" (bonus-maldicao 85))
  (format t "bonus-maldicao(75) = ~A~%~%" (bonus-maldicao 75))
  
  ;; Teste de filtro de armas
  (format t "~%=== FILTRO: Apenas Armas ===~%")
  (let ((armas (remove-if-not (lambda (item)
                                (eq (item-tipo item) 'arma))
                              *catalogo*)))
    (format t "Armas encontradas: ~A~%~%" (length armas))
    (dolist (arma armas)
      (exibe-item arma)))
  
  ;; Teste completo: processa-venda
  (format t "~%=== PROCESSAMENTO DE VENDA COMPLETO ===~%")
  (format t "Aplicando: Filtro de Armas → Imposto 15%% → Bônus Maldição~%~%")
  (let ((resultado (processa-venda *catalogo*)))
    (format t "Resultados:~%~%")
    (dolist (item-processado resultado)
      (exibe-resultado-venda item-processado)))
  
  ;; Análise dos resultados
  (format t "~%=== ANÁLISE ===~%")
  (format t "Armas com força > 80 recebem bônus de 50%% na força mágica~%")
  (format t "Todas as armas têm preço aumentado em 15%%~%"))

;; Executar os testes
(testes-loja)
