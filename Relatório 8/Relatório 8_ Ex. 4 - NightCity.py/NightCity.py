from abc import ABC, abstractmethod

class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass


class Implante:
    def __init__(self, custo: float, funcao: str):
        self.custo = custo
        self.funcao = funcao

    def __str__(self):
        return f"Implante de {self.funcao} (custo: {self.custo} créditos)"


class NetRunner(Cibernetico):
    def __init__(self, nome: str, custo_implante: float, funcao_implante: str):
        self.nome = nome
        self.implante = Implante(custo_implante, funcao_implante)

    def realizar_hack(self):
        print(f"{self.nome} usa {self.implante.funcao} para invadir o sistema!")

class Faccao:
    def __init__(self, nome: str, membros: list[Cibernetico] = None):
        self.nome = nome
        self.membros = membros if membros else []  # agregação

    def adicionar_membro(self, membro: Cibernetico):
        self.membros.append(membro)

    def mandar_hackear(self):
        print(f"=== Fação {self.nome} iniciou uma invasão coordenada ===")
        for membro in self.membros:
            membro.realizar_hack()

if __name__ == "__main__":

    v = NetRunner("V", 3000, "Implante Neural de Hackeamento")
    lucy = NetRunner("Lucy", 5000, "Interface Cibernética Avançada")
    kiwi = NetRunner("Kiwi", 4500, "Implante de Análise Remota")

    maelstrom = Faccao("Maelstrom")
    maelstrom.adicionar_membro(v)
    maelstrom.adicionar_membro(lucy)
    maelstrom.adicionar_membro(kiwi)

    maelstrom.mandar_hackear()
