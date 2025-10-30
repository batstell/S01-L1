class Pokemon {
  #vida;

  constructor(nome, tipo, vidaInicial) {
    this.nome = nome;
    this.tipo = tipo;
    this.#vida = vidaInicial;
  }

  getVida() {
    return this.#vida;
  }

  receberDano(dano) {
    this.#vida -= dano;
    if (this.#vida < 0) this.#vida = 0;
  }

  atacar(alvo) {
    console.log(`${this.nome} atacou ${alvo.nome}, mas foi um ataque genérico.`);
    alvo.receberDano(5);
  }
}

class PokemonFogo extends Pokemon {
  constructor(nome, vidaInicial, bonusAtaque) {
    super(nome, 'Fogo', vidaInicial);
    this.bonusAtaque = bonusAtaque;
  }

  atacar(alvo) {
    const dano = 10 + this.bonusAtaque;
    console.log(`${this.nome} lançou uma bola de fogo em ${alvo.nome}, causando ${dano} de dano!`);
    alvo.receberDano(dano);
  }
}

class PokemonAgua extends Pokemon {
  #curaBase;
  constructor(nome, vidaInicial, curaBase) {
    super(nome, 'Água', vidaInicial);
    this.#curaBase = curaBase;
  }

  atacar(alvo) {
    console.log(`${this.nome} lançou um jato d’água em ${alvo.nome}!`);
    alvo.receberDano(8);
    console.log(`${this.nome} se curou em ${this.#curaBase} pontos de vida!`);
  }
}

const charmander = new PokemonFogo("Charmander", 40, 5);
const squirtle = new PokemonAgua("Squirtle", 45, 3);

charmander.atacar(squirtle);
squirtle.atacar(charmander);
