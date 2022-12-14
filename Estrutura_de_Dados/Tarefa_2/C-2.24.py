"""
Estrutura de dados ( 2022.2 - T01 ) - Tarefa 02

Aluno: Levi Ferreira de Morais

Questão C-2.24:

Suppose you are on the design team for a new e-book reader. What are the
primary classes and methods that the Python software for your reader will
need? You should include an inheritance diagram for this code, but you
do not need to write any actual code. Your software architecture should
at least include ways for customers to buy new books, view their list of
purchased books, and read their purchased books

"""

# Diagrama de Herança (Exemplo da questão): https://bit.ly/3ehop42
# Diagrama de Herança desse código: https://bit.ly/3pVxodP
# Em um programa como esse uma classe de Livro seria criada para colocar no leitor de Ebook
# Pois há livros com capa dura, capa fina, páginas ilustradas...
# Então vários tipos de livros iriam herdar a classe livro.
# Além das opções de comprar um livro, verificar a biblioteca de livros e lê-los...
# Nesse exercício, para botar em prática, fui para um caminho mais diferente criando apenas uma classe de
# leitor de Ebook :)

class ebookReader:

    def __init__(self, usuario: str):
        self.usuario = usuario
        self.livro_comprado = list()

    def comprar_livro(self, livro: str):
        self.livro_comprado.append(livro)

        return livro

    def livros_comprados(self):
        print('\nEstes são os livros que você possui:')
        return self.livro_comprado

    def ler_livro(self, livro: str):

        tem_livro = False

        for i in range(len(self.livro_comprado)):
            if self.livro_comprado[i] == livro:
                print('\n Você está lendo este livro: ' + livro)
                tem_livro = True
        if not tem_livro:
            print('\n Você não tem este livro...')


if __name__ == '__main__':

    # Teste padrão

    # teste = ebookReader('tester')
    # teste.comprar_livro('Pinóquio')
    # print(teste.livros_comprados())
    # print(teste.ler_livro('Pinóquio'))

    # Teste com o terminal!

    user = ebookReader(input('Olá! digite seu nome para acessar o leitor de E-Book.' + '\n'))
    escolha = '0'

    rodando = True


    def escolhaMenu():
        escolha = input('\nEscolha uma opção: \n'
                        '1 - Comprar livro. \n'
                        '2 - Ver os livros que você comprou. \n'
                        '3 - Ler um livro que você comprou. \n'
                        '00 - Sair \n')
        return escolha


    while rodando:
        if escolha == '0':
            escolha = input(f'Bem-vindo {user.usuario}, escolha uma opção. \n'
                            '1 - Comprar livro. \n'
                            '2 - Ver os livros que você comprou. \n'
                            '3 - Ler um livro que você comprou. \n'
                            '00 - Sair \n')

        if escolha == '1':
            compra = user.comprar_livro(input('\nDigite o nome do livro que você quer comprar (Ex: Moby Dick): \n'))
            print(f'Você comprou o livro {compra}!')
            escolha = escolhaMenu()

        elif escolha == '2':
            print(user.livros_comprados())
            escolha = escolhaMenu()

        elif escolha == '3':
            user.ler_livro(input('\nDigite o nome do livro que você quer ler. \n'))
            escolha = escolhaMenu()

        elif escolha == '00':
            rodando = False

        else:
            print('\nEssa opção não existe, voltando para o menu inicial... \n')
            escolha = '0'
