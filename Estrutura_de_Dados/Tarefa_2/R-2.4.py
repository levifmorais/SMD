"""
Estrutura de dados ( 2022.2 - T01 ) - Tarefa 02

Aluno: Levi Ferreira de Morais

Questão R-2.4:

Write a Python class, Flower, that has three instance variables of type str,
int, and float, that respectively represent the name of the flower, its number of petals, and its price.
Your class must include a constructor method that initializes each variable to an appropriate value,
and your class should include methods for setting the value of each type,
and retrieving the value of each type.

"""


class Flor:

    # Construtor
    def __init__(self):
        self.nome = str('Rosa')
        self.petalas = int(5)
        self.preco = float(3.50)

    # Getter e Setter do Nome
    def set_nome(self, nome: str):
        self.nome = str(nome)

    def get_nome(self):
        return self.nome

    # Getter e Setter das Pétalas
    def set_petalas(self, petalas: int):
        self.petalas = abs(int(petalas))

    def get_petalas(self):
        return self.petalas

    # Getter e Setter do Preço
    def set_preco(self, preco: float):
        self.preco = abs(float(preco))

    def get_preco(self):
        return self.preco


if __name__ == '__main__':
    x = Flor()
    print('Nome:', x.get_nome(), '\n',
          'N° de petalas:', x.get_petalas(), '\n',
          'Preço:', x.get_preco()
          )

    x.set_nome('Tulipa')
    x.set_petalas(8)
    x.set_preco(12.9)

    print('Nome:', x.get_nome(), '\n',
          'N° de petalas:', x.get_petalas(), '\n',
          'Preço:', x.get_preco()
          )
