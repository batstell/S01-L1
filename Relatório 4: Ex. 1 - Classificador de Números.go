package main

import "fmt"

func classificar_numero(num int) string {
	if num > 0 {
		return "Positivo"
	} else if num < 0 {
		return "Negativo"
	}
	return "Zero"
}

func main() {
	var n int
	fmt.Print("Digite um número: ")
	fmt.Scanln(&n)

	fmt.Println("Classificação:", classificar_numero(n))
}
