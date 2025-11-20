;; EXERCÍCIO 2: CATÁLOGO DE FAUNA - PLANET 4546B

;; 1. Definição da Estrutura: criatura
(defstruct criatura
  "Estrutura para representar uma criatura do Planet 4546B"
  nome
  ambiente
  periculosidade
  vida-media)

;; 2. Catálogo Inicial: lista com pelo menos 4 criaturas
(defparameter *catalogo*
  (list
   ;; Um peixe Safe Shallows (Periculosidade Baixa)
   (make-criatura :nome "Peeper"
                  :ambiente "Safe Shallows"
                  :periculosidade 'baixa
                  :vida-media 5)
   
   ;; Um Reaper Leviathan (Periculosidade Alta)
   (make-criatura :nome "Reaper Leviathan"
                  :ambiente "Dunes"
                  :periculosidade 'alta
                  :vida-media 100)
   
   ;; Duas criaturas quaisquer com ambiente Deep
   (make-criatura :nome "Ghost Leviathan"
                  :ambiente "Deep"
                  :periculosidade 'alta
                  :vida-media 120)
   
   (make-criatura :nome "Crabsquid"
                  :ambiente "Deep"
                  :periculosidade 'media
                  :vida-media 30))
  "Catálogo de fauna do Planet 4546B")

;; 3. HOF: Filtro de Perigo
;; Retorna apenas as criaturas cuja periculosidade não seja Baixa
(defun filtra-por-perigo (catalogo)
  "Filtra criaturas removendo aquelas com periculosidade baixa"
  (remove-if (lambda (criatura)
               (eq (criatura-periculosidade criatura) 'baixa))
             catalogo))

;; 4. Mapeamento de Informações
;; Retorna uma lista de strings no formato "[NOME]: Vive em [AMBIENTE]"
;; mas apenas para criaturas do ambiente "Deep"
(defun relatorio-profundidade (catalogo)
  "Gera relatório de criaturas que vivem no ambiente Deep"
  (mapcar (lambda (criatura)
            (format nil "[~A]: Vive em [~A]"
                    (criatura-nome criatura)
                    (criatura-ambiente criatura)))
          ;; Primeiro filtra apenas criaturas do ambiente Deep
          (remove-if-not (lambda (criatura)
                          (string-equal (criatura-ambiente criatura) "Deep"))
                        catalogo)))

;; Função auxiliar para exibir informações de uma criatura
(defun exibe-criatura (criatura)
  "Exibe as informações de uma criatura de forma formatada"
  (format t "  Nome: ~A~%" (criatura-nome criatura))
  (format t "  Ambiente: ~A~%" (criatura-ambiente criatura))
  (format t "  Periculosidade: ~A~%" (criatura-periculosidade criatura))
  (format t "  Vida Média: ~A anos~%~%" (criatura-vida-media criatura)))

;; Função para testes completos
(defun testes-catalogo ()
  "Executa testes do sistema de catálogo de fauna"
  (format t "~%========================================~%")
  (format t "CATÁLOGO DE FAUNA - PLANET 4546B~%")
  (format t "========================================~%~%")
  
  ;; Exibe catálogo completo
  (format t "=== CATÁLOGO COMPLETO ===~%")
  (format t "Total de criaturas: ~A~%~%" (length *catalogo*))
  (dolist (criatura *catalogo*)
    (exibe-criatura criatura))
  
  ;; Teste do filtro de perigo
  (format t "~%=== FILTRO DE PERIGO (Remove Baixa) ===~%")
  (let ((perigosas (filtra-por-perigo *catalogo*)))
    (format t "Criaturas perigosas: ~A~%~%" (length perigosas))
    (dolist (criatura perigosas)
      (exibe-criatura criatura)))
  
  ;; Teste do relatório de profundidade
  (format t "~%=== RELATÓRIO DE PROFUNDIDADE (Ambiente Deep) ===~%")
  (let ((relatorio (relatorio-profundidade *catalogo*)))
    (dolist (linha relatorio)
      (format t "~A~%" linha)))
  
  ;; Teste combinado: filtro + relatório
  (format t "~%~%=== TESTE COMBINADO: Filtro + Relatório ===~%")
  (format t "Criaturas perigosas do Deep:~%")
  (let* ((perigosas (filtra-por-perigo *catalogo*))
         (relatorio-perigosas (relatorio-profundidade perigosas)))
    (dolist (linha relatorio-perigosas)
      (format t "~A~%" linha))))

;; Função para adicionar criaturas ao catálogo
(defun adiciona-criatura (nome ambiente periculosidade vida-media)
  "Adiciona uma nova criatura ao catálogo"
  (push (make-criatura :nome nome
                       :ambiente ambiente
                       :periculosidade periculosidade
                       :vida-media vida-media)
        *catalogo*)
  (format t "Criatura ~A adicionada ao catálogo!~%" nome))

;; Executar os testes
(testes-catalogo)
