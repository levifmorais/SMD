"""
Estrutura de dados ( 2022.2 - T01 ) - Tarefa 02

Aluno: Levi Ferreira de Morais

Questão P-2.36:

Write a Python program to simulate an ecosystem containing two types
of creatures, bears and fish. The ecosystem consists of a river, which is
modeled as a relatively large list. Each element of the list should be a
Bear object, a Fish object, or None. In each time step, based on a random
process, each animal either attempts to move into an adjacent list location
or stay where it is. If two animals of the same type are about to collide in
the same cell, then they stay where they are, but they create a new instance
of that type of animal, which is placed in a random empty (i.e., previously
None) location in the list. If a bear and a fish collide, however, then the
fish dies (i.e., it disappears)

Essa solução está ERRADA e INCOMPLETA!!!

"""
import random
import time


class Urso:

    def __str__(self):
        return 'U'


class Peixe:

    def __str__(self):
        return 'P'


if __name__ == '__main__':

    rio = ['N'] * 30

    play = True

    # ecossistema = [Urso().__str__(), Peixe().__str__(), 'N']

    rio[2] = Urso().__str__()
    rio[6] = Urso().__str__()
    rio[20] = Peixe().__str__()
    rio[22] = Peixe().__str__()
    rio[24] = Peixe().__str__()
    rio[26] = Peixe().__str__()


    def move():
        return random.randint(0, 2)


    # for i in range(len(rio)):
    # rio[i] = random.choice(ecossistema)
    print(rio)

    while play:
        time.sleep(1)
        for i in range(len(rio)):
            prev = i - 1
            animal = i
            nxt = i + 1
            if 0 < i < (len(rio) - 1):
                if rio[animal] == Urso().__str__():
                    # Checa se o valor antes ou depois do urso é um Peixe, em seguida transforma-o em 'Nada'
                    if rio[prev] == Peixe().__str__():
                        rio[prev] = 'N'
                    elif rio[nxt] == Peixe().__str__():
                        rio[nxt] = 'N'
                    # Checa se há urso, se tiver escolhe um lugar onde não há animal para criar um novo urso.
                    if rio[prev] == Urso().__str__():
                        for j in range(len(rio)):
                            if rio[j] == 'N':
                                rio[j] = Urso().__str__()
                                break
                    elif rio[nxt] == Urso().__str__():
                        for j in range(len(rio)):
                            if rio[j] == 'N':
                                rio[j] = Urso().__str__()
                                break
                    # Escolhe aleatoriamente se vai movimentar e pra qual lado movimentar. 1 -> Esquerda | 2 -> Direita
                    check = move()
                    if check == 0:
                        pass
                    elif check == 1 and rio[prev] == 'N':
                        rio[prev] = Urso().__str__()
                        rio[animal] = 'N'
                        check = 0
                    elif check == 2 and rio[nxt] == 'N':
                        rio[nxt] = Urso().__str__()
                        rio[animal] = 'N'
                        check = 0
                # Checa se há peixe, se tiver escolhe um lugar onde não há animal para criar um novo peixe.
                if rio[animal] == Peixe().__str__():
                    if rio[prev] == Peixe().__str__():
                        for j in range(len(rio)):
                            if rio[j] == 'N':
                                rio[j] = Peixe().__str__()
                                break
                    elif rio[nxt] == Peixe().__str__():
                        for j in range(len(rio)):
                            if rio[j] == 'N':
                                rio[j] = Peixe().__str__()
                                break
                    # Escolhe aleatoriamente se vai movimentar e pra qual lado movimentar. 1 -> Esquerda | 2 -> Direita
                    check = move()
                    if check == 0:
                        pass
                    elif check == 1 and rio[prev] == 'N':
                        rio[prev] = Peixe().__str__()
                        rio[animal] = 'N'
                        check = 0
                    elif check == 2 and rio[nxt] == 'N':
                        rio[nxt] = Peixe().__str__()
                        rio[animal] = 'N'
                        check = 0

        print(f'-RIO-\n{rio}\n')
