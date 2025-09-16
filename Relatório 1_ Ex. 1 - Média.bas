10 INPUT "Forneça o valor da primeira nota: "; a
20 INPUT "Forneça o valor da segunda nota: "; b
30 media = (VAL(a)+VAL(b))/2
40 IF media > 60 THEN PRINT "Aprovado direto!"
50 IF media < 30 THEN PRINT "Reprovado direto."
60 IF media >= 30 AND media <= 60 THEN INPUT "Por favor, forneça uma nova nota: "; c
70 newmedia = (VAL(a)+VAL(b)+VAL(c))/3
80 IF newmedia >= 50 THEN PRINT "Aprovado pela NP3!" ELSE PRINT "Reprovado na NP3."
90 END
