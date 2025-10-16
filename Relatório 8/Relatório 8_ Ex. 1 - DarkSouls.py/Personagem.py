
class Personagem:
    def __init__(self, vida: int, resistencia: int):
        self._vida = vida
        self._resistencia = resistencia

    @property
    def vida(self):
        return self._vida

    @vida.setter
    def vida(self, nova_vida):

        if nova_vida >= 0:
            self._vida = nova_vida

        else: print("A vida não pode ser negativa!")

    @property
    def resistencia(self):
        return self._resistencia

    @resistencia.setter
    def resistencia(self, _resistencia):
        self._resistencia = _resistencia

    def __str__(self):
        return f"Personagem com {self._vida} de vida e {self._resistencia} de resistência"


class Cavaleiro(Personagem):

    def __init__(self, vida, resistencia, armadura_pesada: bool):
        super().__init__(vida, resistencia)
        self.armadura_pesada = armadura_pesada

    def __str__(self):
        tipo_armadura = "pesada" if self.armadura_pesada else "leve"
        return f"Cavaleiro com {self._vida} de vida, {self._resistencia} de resistência e armadura {tipo_armadura}"