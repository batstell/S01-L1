package main

import "fmt"

func main() {
	var n int
	fmt.Print("Digite um número: ")
	fmt.Scanln(&n)

	switch n % 2 {
	case 0:
		fmt.Println("O número é par")
	default:
		fmt.Println("O número é ímpar")
	}
}
