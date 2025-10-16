from abc import ABC, abstractmethod

class Heroi(ABC):
    def __init__(self, nome: str, funcao: str):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self):
        pass  # Método que será sobrescrito pelas classes filhas


class Tanque(Heroi):
    def usar_ultimate(self):
        print(f"{self.nome} (Tanque) ativa o escudo e protege todo o time!")


class Dano(Heroi):
    def usar_ultimate(self):
        print(f"{self.nome} (Dano) dispara uma chuva de balas devastadora!")


class Suporte(Heroi):
    def usar_ultimate(self):
        print(f"{self.nome} (Suporte) cura todos os aliados e reforça a equipe!")


if __name__ == "__main__":
    herois = [
        Tanque("Reinhardt", "Tanque"),
        Dano("Soldado: 76", "Dano"),
        Suporte("Mercy", "Suporte"),
    ]

    for heroi in herois:
        heroi.usar_ultimate()