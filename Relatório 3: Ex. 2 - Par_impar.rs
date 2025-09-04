use std::io;

fn eh_par(numero: i32) -> bool {
    numero % 2 == 0
}

fn main() {
    
    let mut escolha = String::new();
    println!("Jogador 1, escolha entre 'par' ou 'ímpar': ");
    io::stdin()
        .read_line(&mut escolha)
        .expect("Erro ao ler entrada");
    let escolha = escolha.trim().to_lowercase();

    let mut num1 = String::new();
    println!("Jogador 1, digite seu número (inteiro): ");
    io::stdin()
        .read_line(&mut num1)
        .expect("Erro ao ler número");
    let num1: i32 = num1.trim().parse().expect("Digite um número válido");

    let mut num2 = String::new();
    println!("Jogador 2, digite seu número (inteiro): ");
    io::stdin()
        .read_line(&mut num2)
        .expect("Erro ao ler número");
    let num2: i32 = num2.trim().parse().expect("Digite um número válido");

    let soma = num1 + num2;

    if eh_par(soma) {
        if escolha == "par" {
            println!("Soma = {}. Jogador 1 venceu!", soma);
        } else {
            println!("Soma = {}. Jogador 2 venceu!", soma);
        }
    } else {
        if escolha == "ímpar" {
            println!("Soma = {}. Jogador 1 venceu!", soma);
        } else {
            println!("Soma = {}. Jogador 2 venceu!", soma);
        }
    }
}
