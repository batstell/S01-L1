;; EXERCÍCIO 1: FARMÁCIA DA MAOMAO

;; 1. Função Pura: calcula-dosagem
;; Retorna a dosagem base (ml) seguindo as regras especificadas
(defun calcula-dosagem (peso-kg idade-anos)
  "Calcula a dosagem em ml baseada no peso e idade do paciente"
  (cond
    ;; Se idade < 5 OU peso < 20kg -> 10ml
    ((or (< idade-anos 5) (< peso-kg 20))
     10)
    ;; Se idade entre 5 e 12 (inclusive) E peso >= 20kg -> 25ml
    ((and (>= idade-anos 5) (<= idade-anos 12) (>= peso-kg 20))
     25)
    ;; Caso contrário -> 50ml
    (t 50)))

;; 2. Função Pura: ajusta-preco
;; Aplica um fator de preço com base no nome da erva
(defun ajusta-preco (preco-base nome-da-erva)
  "Ajusta o preço baseado no nome da erva medicinal"
  (cond
    ;; Se nome for "Ginseng" -> multiplica por 3.0
    ((string-equal nome-da-erva "Ginseng")
     (* preco-base 3.0))
    ;; Se nome for "Lótus" -> multiplica por 1.5
    ((string-equal nome-da-erva "Lótus")
     (* preco-base 1.5))
    ;; Caso contrário -> retorna preço base
    (t preco-base)))

;; 3. Função para calcular o preço final
(defun calcula-preco-final (nome-erva preco-base peso-kg idade-anos)
  "Calcula o preço final de uma dose considerando o tipo de erva e características do paciente"
  (let* ((dosagem (calcula-dosagem peso-kg idade-anos))
         (preco-ajustado (ajusta-preco preco-base nome-erva)))
    (values preco-ajustado dosagem)))

;; Teste: paciente de 14 anos e 60kg com "Lótus" (preço base 10 moedas)
(defun teste-lotus ()
  "Teste específico solicitado no exercício"
  (multiple-value-bind (preco dosagem)
      (calcula-preco-final "Lótus" 10 60 14)
    (format t "~%=== TESTE: LÓTUS ===~%")
    (format t "Paciente: 14 anos, 60kg~%")
    (format t "Erva: Lótus~%")
    (format t "Preço base: 10 moedas~%")
    (format t "Dosagem calculada: ~Aml~%" dosagem)
    (format t "Preço final: ~A moedas~%~%" preco)))

;; Testes adicionais para mostrar outros casos
(defun testes-completos ()
  "Executa testes para diferentes cenários"
  (format t "~%========================================~%")
  (format t "TESTES DO SISTEMA FARMÁCIA DA MAOMAO~%")
  (format t "========================================~%")
  
  ;; Teste 1: Lótus (do enunciado)
  (teste-lotus)
  
  ;; Teste 2: Criança pequena com Ginseng
  (multiple-value-bind (preco dosagem)
      (calcula-preco-final "Ginseng" 10 15 4)
    (format t "=== TESTE: GINSENG (Criança) ===~%")
    (format t "Paciente: 4 anos, 15kg~%")
    (format t "Erva: Ginseng~%")
    (format t "Preço base: 10 moedas~%")
    (format t "Dosagem calculada: ~Aml~%" dosagem)
    (format t "Preço final: ~A moedas~%~%" preco))
  
  ;; Teste 3: Criança média
  (multiple-value-bind (preco dosagem)
      (calcula-preco-final "Camomila" 10 25 8)
    (format t "=== TESTE: Erva comum (Criança média) ===~%")
    (format t "Paciente: 8 anos, 25kg~%")
    (format t "Erva: Camomila~%")
    (format t "Preço base: 10 moedas~%")
    (format t "Dosagem calculada: ~Aml~%" dosagem)
    (format t "Preço final: ~A moedas~%~%" preco))
  
  ;; Teste 4: Adulto
  (multiple-value-bind (preco dosagem)
      (calcula-preco-final "Ginseng" 10 70 30)
    (format t "=== TESTE: GINSENG (Adulto) ===~%")
    (format t "Paciente: 30 anos, 70kg~%")
    (format t "Erva: Ginseng~%")
    (format t "Preço base: 10 moedas~%")
    (format t "Dosagem calculada: ~Aml~%" dosagem)
    (format t "Preço final: ~A moedas~%~%" preco)))

;; Executar os testes
(testes-completos)
