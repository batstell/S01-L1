class Hunter {
  constructor(nome, local, idade) {
    this.nome = nome;
    this.localizacao = local;
    this.idade = idade;
  }

  rastrearLocal(lat, long) {
    return `${this.nome} está rastreando na posição ${lat}, ${long}.`;
  }
}

class Especialista extends Hunter {
  constructor(nome, habilidade) {
    super(nome, "Desconhecido", 25);
    this.habilidadeNen = habilidade;
  }

  rastrearLocal(lat, long) {
    return `${this.nome} (Especialista em ${this.habilidadeNen}) localizou algo em ${lat}, ${long}.`;
  }
}

class Manipulador extends Hunter {
  constructor(nome, alvoAtual) {
    super(nome, "Desconhecido", 22);
    this.alvoAtual = alvoAtual;
  }

  rastrearLocal(lat, long) {
    return `${this.nome} manipulou seu alvo ${this.alvoAtual} e rastreou em ${lat}, ${long}.`;
  }
}

class Batalhao {
  constructor() {
    this.hunters = new Set();
  }

  adicionarHunter(hunter) {
    this.hunters.add(hunter);
  }

  getNumHunters() {
    return this.hunters.size;
  }

  iniciarRastreamento(lat, long) {
    return Array.from(this.hunters).map(h => h.rastrearLocal(lat, long));
  }
}

const gon = new Especialista("Gon", "Jajanken");
const illumi = new Manipulador("Illumi", "Hisoka");

const batalhao = new Batalhao();
batalhao.adicionarHunter(gon);
batalhao.adicionarHunter(illumi);

console.log(batalhao.iniciarRastreamento("35.6°N", "139.7°E"));