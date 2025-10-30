class Criatura {
  constructor(nome, perigosa) {
    this.nome = nome;
    this.perigosa = perigosa;
  }
}

class Diario {
  #autorSecreto;
  constructor(autor) {
    this.#autorSecreto = autor;
    this.enigmas = new Map();
    this.criaturasAvistadas = [];
  }

  getAutor() {
    return this.#autorSecreto;
  }

  adicionarEnigma(num, enigma) {
    this.enigmas.set(num, enigma);
  }

  decodificar(chave, num) {
    if (chave === this.#autorSecreto && this.enigmas.has(num)) {
      return this.enigmas.get(num);
    }
    return "Acesso negado.";
  }
}

class Personagem {
  constructor(nome, idade) {
    this.nome = nome;
    this.idade = idade;
  }
}

class Protagonista extends Personagem {
  constructor(nome, idade, diario) {
    super(nome, idade);
    this.diario = diario;
  }
}

class CabanaMisterio {
  constructor(diarista) {
    this.visitantes = [];
    this.funcionarios = [diarista];
  }

  listarFuncionarios() {
    return this.funcionarios;
  }
}

const diario3 = new Diario("Dipper");
diario3.adicionarEnigma(1, "O segredo está nas sombras...");

const dipper = new Protagonista("Dipper", 12, diario3);
const cabana = new CabanaMisterio(dipper);
console.log(diario3.decodificar("Dipper", 1));
console.log(cabana.listarFuncionarios());
