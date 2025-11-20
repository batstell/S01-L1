;; EXERCÍCIO 4: GERENCIAMENTO DE OCORRÊNCIAS

;; 1. Estrutura: ocorrencia
(defstruct ocorrencia
  "Estrutura para representar uma ocorrência paranormal"
  nome
  ritual
  nivel-medo
  agentes-enviados)

;; Lista de ocorrências para testes
(defparameter *ocorrencias*
  (list
   (make-ocorrencia :nome "Mansão Assombrada"
                    :ritual "Exorcismo"
                    :nivel-medo 7
                    :agentes-enviados 2)
   
   (make-ocorrencia :nome "Floresta dos Sussurros"
                    :ritual "Selamento"
                    :nivel-medo 9
                    :agentes-enviados 5)
   
   (make-ocorrencia :nome "Cemitério Abandonado"
                    :ritual "Purificação"
                    :nivel-medo 6
                    :agentes-enviados 3)
   
   (make-ocorrencia :nome "Hospital Maldito"
                    :ritual "Banimento"
                    :nivel-medo 8
                    :agentes-enviados 4)
   
   (make-ocorrencia :nome "Escola Fantasma"
                    :ritual "Contenção"
                    :nivel-medo 5
                    :agentes-enviados 2))
  "Lista de ocorrências paranormais da Ordem")

;; 2. Função Recursiva: soma-medo-recursiva
(defun soma-medo-recursiva (lista-ocorrencias)
  "Percorre a lista recursivamente e retorna a soma total do campo nivel-medo"
  (if (null lista-ocorrencias)
      0  ; Caso base: lista vazia retorna 0
      (+ (ocorrencia-nivel-medo (car lista-ocorrencias))  ; Soma o primeiro elemento
         (soma-medo-recursiva (cdr lista-ocorrencias))))) ; Recursão no resto da lista

;; 3. Função de Alto Nível (Composição e Local Scope): analise-final

(defun analise-final (lista-ocorrencias)
  "Realiza análise completa das ocorrências e retorna lista de ocorrências críticas"
  
  ;; a. Calcula Média usando função recursiva e armazena em variável local (let)
  (let* ((soma-total (soma-medo-recursiva lista-ocorrencias))
         (total-ocorrencias (length lista-ocorrencias))
         (media-nivel-medo (if (> total-ocorrencias 0)
                              (/ soma-total total-ocorrencias)
                              0))
         
         ;; b. Filtra Ocorrências Críticas: mais de 3 agentes E nível-medo acima da média
         (ocorrencias-criticas 
          (remove-if-not (lambda (ocorrencia)
                          (and (> (ocorrencia-agentes-enviados ocorrencia) 3)
                               (> (ocorrencia-nivel-medo ocorrencia) media-nivel-medo)))
                        lista-ocorrencias)))
    
    ;; Exibe informações da análise
    (format t "~%=== ANÁLISE DE EXPOSIÇÃO PARANORMAL ===~%")
    (format t "Total de ocorrências: ~A~%" total-ocorrencias)
    (format t "Soma total do nível de medo: ~A~%" soma-total)
    (format t "Média do nível de medo: ~,2F~%~%" media-nivel-medo)
    (format t "Critérios para ocorrências críticas:~%")
    (format t "  - Mais de 3 agentes enviados~%")
    (format t "  - Nível de medo acima da média (~,2F)~%~%" media-nivel-medo)
    
    ;; c. Composição: Retorna apenas a lista de nomes das ocorrências críticas
    (mapcar #'ocorrencia-nome ocorrencias-criticas)))

;; Funções auxiliares para exibição

(defun exibe-ocorrencia (ocorrencia)
  "Exibe as informações de uma ocorrência de forma formatada"
  (format t "  Nome: ~A~%" (ocorrencia-nome ocorrencia))
  (format t "  Ritual: ~A~%" (ocorrencia-ritual ocorrencia))
  (format t "  Nível de Medo: ~A~%" (ocorrencia-nivel-medo ocorrencia))
  (format t "  Agentes Enviados: ~A~%~%" (ocorrencia-agentes-enviados ocorrencia)))

;; Função de testes completos

(defun testes-ocorrencias ()
  "Executa testes do sistema de gerenciamento de ocorrências"
  (format t "~%========================================~%")
  (format t "SISTEMA DE GERENCIAMENTO DE OCORRÊNCIAS~%")
  (format t "Ordem Paranormal~%")
  (format t "========================================~%~%")
  
  ;; Exibe todas as ocorrências
  (format t "=== REGISTRO DE OCORRÊNCIAS ===~%~%")
  (dolist (ocorrencia *ocorrencias*)
    (exibe-ocorrencia ocorrencia))
  
  ;; Teste da função recursiva isolada
  (format t "~%=== TESTE: Função Recursiva soma-medo-recursiva ===~%")
  (let ((soma (soma-medo-recursiva *ocorrencias*)))
    (format t "Soma total do nível de medo (recursiva): ~A~%~%" soma))
  
  ;; Teste da análise final completa
  (format t "~%=== ANÁLISE FINAL ===~%")
  (let ((resultado (analise-final *ocorrencias*)))
    (format t "~%=== OCORRÊNCIAS CRÍTICAS IDENTIFICADAS ===~%")
    (if resultado
        (progn
          (format t "Total de ocorrências críticas: ~A~%~%" (length resultado))
          (format t "Lista de ocorrências críticas:~%")
          (dolist (nome resultado)
            (format t "  - ~A~%" nome)))
        (format t "Nenhuma ocorrência crítica identificada.~%")))
  
  ;; Análise detalhada
  (format t "~%~%=== DETALHAMENTO DAS OCORRÊNCIAS CRÍTICAS ===~%")
  (let* ((media (/ (soma-medo-recursiva *ocorrencias*)
                   (length *ocorrencias*)))
         (criticas (remove-if-not (lambda (ocorrencia)
                                   (and (> (ocorrencia-agentes-enviados ocorrencia) 3)
                                        (> (ocorrencia-nivel-medo ocorrencia) media)))
                                 *ocorrencias*)))
    (if criticas
        (dolist (ocorrencia criticas)
          (exibe-ocorrencia ocorrencia))
        (format t "Nenhuma ocorrência crítica encontrada.~%"))))

;; Teste Final: Criar lista personalizada
(defun teste-final-personalizado ()
  "Teste final com lista personalizada de 4-5 ocorrências"
  (format t "~%~%========================================~%")
  (format t "TESTE FINAL - LISTA PERSONALIZADA~%")
  (format t "========================================~%~%")
  
  (let ((lista-teste 
         (list
          (make-ocorrencia :nome "Catacumbas Profundas"
                           :ritual "Ritual Ancestral"
                           :nivel-medo 10
                           :agentes-enviados 6)
          
          (make-ocorrencia :nome "Casa da Colina"
                           :ritual "Exorcismo Simples"
                           :nivel-medo 4
                           :agentes-enviados 2)
          
          (make-ocorrencia :nome "Porto Nebuloso"
                           :ritual "Selamento Marítimo"
                           :nivel-medo 7
                           :agentes-enviados 4)
          
          (make-ocorrencia :nome "Torre do Relógio"
                           :ritual "Contenção Temporal"
                           :nivel-medo 8
                           :agentes-enviados 5))))
    
    (format t "Lista de teste criada com ~A ocorrências~%~%" (length lista-teste))
    (dolist (ocorrencia lista-teste)
      (exibe-ocorrencia ocorrencia))
    
    (format t "~%Executando análise-final...~%")
    (let ((resultado (analise-final lista-teste)))
      (format t "~%Resultado final (nomes das ocorrências críticas):~%")
      (if resultado
          (dolist (nome resultado)
            (format t "  - ~A~%" nome))
          (format t "  Nenhuma ocorrência crítica.~%")))))

;; Executar todos os testes
(testes-ocorrencias)
(teste-final-personalizado)
