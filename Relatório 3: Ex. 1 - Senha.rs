use std::io;

fn verificar_senha(input: &str) -> bool {
    if input.len() < 8 {
        return false;
    }

    let mut tem_numero = false;
    let mut tem_maiuscula = false;

    for caractere in input.chars() {
        if caractere.is_digit(10) {
            tem_numero = true;
        }
        if caractere.is_uppercase() {
            tem_maiuscula = true;
        }
    }

    tem_numero && tem_maiuscula
}

fn main() {
    loop {
        println!("Informe sua senha: ");
        let mut entrada = String::new();

        io::stdin()
            .read_line(&mut entrada)
            .expect("Erro ao ler a senha");

        let entrada = entrada.trim();

        if verificar_senha(entrada) {
            println!("Senha válida! Acesso concedido.");
            break;
        }
    }
}
