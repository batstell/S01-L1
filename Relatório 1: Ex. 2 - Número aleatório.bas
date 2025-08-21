10 b = RND(100)
20 INPUT "Qual o número correto? "; a
30 IF b = a THEN GOTO 80
50 IF a < b THEN PRINT "Você errou! O número correto é maior que o valor digitado."
60 IF a > b THEN PRINT "Você errou! O número correto é menor que o valor digitado."
70 GOTO 20
80 PRINT "Parabéns!!! Você acertou o número!"
90 END
