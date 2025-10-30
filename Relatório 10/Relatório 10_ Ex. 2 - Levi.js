class ODM_Gear {
  constructor(modelo) {
    this.modelo = modelo;
    this.gasRestante = 100;
  }

  usarGas(quantidade) {
    this.gasRestante -= quantidade;
    if (this.gasRestante < 0) this.gasRestante = 0;
  }

  getGas() {
    return this.gasRestante;
  }
}

class Soldado {
  constructor(nome, modeloGear) {
    this.nome = nome;
    this.gear = new ODM_Gear(modeloGear);
  }

  explorarTerritorio() {
    this.gear.usarGas(10);
    return `${this.nome} está explorando com o gear ${this.gear.modelo}. Gas restante: ${this.gear.getGas()}`;
  }

  verificarEquipamento() {
    return `${this.nome} usa o gear ${this.gear.modelo}`;
  }
}

class Esquadrao {
  constructor(lider, membrosIniciais = []) {
    this.lider = lider;
    this.membros = membrosIniciais;
  }

  adicionarMembro(soldado) {
    this.membros.push(soldado);
  }

  explorarTerritorio() {
    return this.membros.map(m => m.explorarTerritorio()).join("\n");
  }

  relatarStatus() {
    return this.membros.map(m => m.verificarEquipamento());
  }
}

const levi = new Soldado("Levi", "Modelo-A");
const mikasa = new Soldado("Mikasa", "Modelo-B");
const esquadrao = new Esquadrao("Levi", [levi, mikasa]);
console.log(esquadrao.explorarTerritorio());