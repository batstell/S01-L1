class ArmaCorpoACorpo:
    def __init__(self, nome: str):
        self.nome = nome

    def __str__(self):
        return f"Arma corpo a corpo: {self.nome}"


class PhantomThieves:
    def __init__(self, nome: str, arma: str):
        self.nome = nome
        self.arma = arma

    def __str__(self):
        return f"{self.nome} - Arma: {self.arma}"


class Joker:
    def __init__(self, membros: list[PhantomThieves]):
        self.arma = ArmaCorpoACorpo("Faca de Aço")
        self.membros = membros

    def mostrar_equipe(self):
        print(f"Joker empunha sua {self.arma.nome}.")
        print("Equipe Phantom Thieves:")
        for membro in self.membros:
            print(f" - {membro}")


if __name__ == "__main__":

    morgana = PhantomThieves("Morgana", "Estilingue")
    ryuji = PhantomThieves("Ryuji", "Porrete")
    ann = PhantomThieves("Ann", "Chicote")

    joker = Joker([morgana, ryuji, ann])

    joker.mostrar_equipe()
