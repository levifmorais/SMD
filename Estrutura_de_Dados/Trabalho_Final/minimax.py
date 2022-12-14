"""
Estrutura de Dados 2022.2

Aluno: Levi Ferreira

Instrucoes:
No trabalho final da disciplina, o objetivo é que você procure por um problema do dia a dia e mostre como ele pode ser resolvido algoritmicamente, 
utilizando estruturas de dados para facilitar a solução.

O trabalho deve ser realizado da seguinte forma:

1 - apresentação do problema: aqui você deve apresentar detalhadamente o problema escolhido. 
Se você se baseou em um vídeo ou texto que encontrou em algum site ou livro,
 você mesmo deve explicá-lo (pode fazer referência ao site/livro, mas deve explicá-lo com suas próprias palavras).

2 - apresentação e justificativa da(s) estrutura(s) de dados que foram escolhidas para ajudar na resolução do problema, 
incluindo aqui também a descrição do(s) algoritmos(s) que foram utilizados para resolvê-lo.

3 - implementação visual da solução, ou seja, a solução deve possuir uma interface gráfica. 
Sugeri, em sala, a utilização da API Pygame (disponível em pygame.org, onde também é possível encontrar um infinidade de tutoriais mostrando seu uso).

Os entregáveis são, portanto:

1- texto descrevendo o problema;
2 - texto, figuras, diagramas, pseudo código(s) do(s) algoritmo(s) utilizados, etc. que descrevem a solução que será implementada;
3- implementação da solução

P-8.68 Write a program that can play Tic-Tac-Toe effectively. (See Section 5.6.)
To do this, you will need to create a game tree T, which is a tree where
each position corresponds to a game configuration, which, in this case,
is a representation of the Tic-Tac-Toe board. (See Section 8.4.2.) The
root corresponds to the initial configuration. For each internal position p
in T, the children of p correspond to the game states we can reach from
p's game state in a single legal move for the appropriate player, A (the
first player) or B (the second player). Positions at even depths correspond
to moves for A and positions at odd depths correspond to moves for B.
Leaves are either final game states or are at a depth beyond which we do
not want to explore. We score each leaf with a value that indicates how
good this state is for player A. In large games, like chess, we have to use a
heuristic scoring function, but for small games, like Tic-Tac-Toe, we can
construct the entire game tree and score leaves as +1, 0, -1, indicating
whether player A has a win, draw, or lose in that configuration. A good
algorithm for choosing moves is minimax. In this algorithm, we assign a
score to each internal position p in T, such that if p represents A's turn, we
compute p's score as the maximum of the scores of p's children (which
corresponds to A's optimal play from p). If an internal node p represents
B's turn, then we compute p's score as the minimum of the

Problema: Fazer um algoritmo que jogue o jogo da velha, procurando sempre a jogada com maior chance de vitoria.

Como ver a aplicacao:
Com os modulos instalados, aperte o botão "Run File" da sua IDE.

"""
import sys
import copy
import random
import pygame as pg
import numpy as np

# Constantes e variaveis
LARGURA = 600
ALTURA = 600

LINHAS = 3
COLUNAS = 3
TAMANHOQUADRADO = LARGURA // COLUNAS

LINHA_LARGURA = 15
CIRC_LARGURA = 15
CRUZ_LARGURA = 20

RAIO = TAMANHOQUADRADO // 4

OFFSET = 50

# Estilizacao

BG_COLOR = 	('#1b0326')
LINHA_COLOR = ('#7a1c4b')
CIRC_COLOR = ('#ba5044')
CRUZ_COLOR = ('#eff9d6')

# PyGame

pg.init()

    # Icone da janela
icon = pg.image.load('Trabalho_Final/assets/icon.png')
pg.display.set_icon(icon)

    # Tela
screen = pg.display.set_mode( (LARGURA, ALTURA) )
pg.display.set_caption('JOGO DA VELHA POR LEVIFMORAIS')

# Background do jogo
screen.fill( BG_COLOR )

# Fonte dos textos
pg.font.init()
font = pg.font.SysFont('freesansbold.ttf',50)


# Classes

class Botao():
	def __init__(self, imagem, pos, texto_input, fonte, cor_base, cor_aproximacao):
		self.imagem = imagem
		self.x_pos = pos[0]
		self.y_pos = pos[1]
		self.fonte = fonte
		self.cor_base, self.cor_aproximacao = cor_base, cor_aproximacao
		self.texto_input = texto_input
		self.texto = self.fonte.render(self.texto_input, True, self.cor_base)
		if self.imagem is None:
			self.imagem = self.texto
		self.rect = self.imagem.get_rect(center=(self.x_pos, self.y_pos))
		self.text_rect = self.texto.get_rect(center=(self.x_pos, self.y_pos))

	def atualizar(self, screen):
		if self.imagem is not None:
			screen.blit(self.imagem, self.rect)
		screen.blit(self.texto, self.text_rect)

	def checarInteracao(self, position):
		if position[0] in range(self.rect.left, self.rect.right) and position[1] in range(self.rect.top, self.rect.bottom):
			return True
		return False

	def mudarCor(self, position):
		if position[0] in range(self.rect.left, self.rect.right) and position[1] in range(self.rect.top, self.rect.bottom):
			self.texto = self.fonte.render(self.texto_input, True, self.cor_aproximacao)
		else:
			self.texto = self.fonte.render(self.texto_input, True, self.cor_base)

class Tabuleiro:

    def __init__(self):
        self.quadrados = np.zeros((LINHAS, COLUNAS)) # array de 0 com tamanaho LINHAS e COLUNAS
        self.quadrado_vazio = self.quadrados
        self.quadrados_marcados = 0

    def fim_de_jogo(self, show = False):

        # Vitorias verticais
        for coluna in range(COLUNAS):
            if self.quadrados[0][coluna] == self.quadrados[1][coluna] == self.quadrados[2][coluna] != 0:
                if show:
                    color = CIRC_COLOR if self.quadrados[0][coluna] == 2 else CRUZ_COLOR
                    iPos = (coluna * TAMANHOQUADRADO + TAMANHOQUADRADO // 2, 20)
                    fPos = (coluna * TAMANHOQUADRADO + TAMANHOQUADRADO // 2, ALTURA - 20)
                    pg.draw.line(screen, color, iPos, fPos, LINHA_LARGURA)
                return self.quadrados[0][coluna]

        # Vitorias horizontais
        for linha in range(LINHAS):
            if self.quadrados[linha][0] == self.quadrados[linha][1] == self.quadrados[linha][2] != 0:
                if show:
                    color = CIRC_COLOR if self.quadrados[linha][0] == 2 else CRUZ_COLOR
                    iPos = (20, linha * TAMANHOQUADRADO + TAMANHOQUADRADO // 2)
                    fPos = (LARGURA - 20, linha * TAMANHOQUADRADO + TAMANHOQUADRADO // 2)
                    pg.draw.line(screen, color, iPos, fPos, LINHA_LARGURA)
                return self.quadrados[linha][0]

        # desc diagonal
        if self.quadrados[0][0] == self.quadrados[1][1] == self.quadrados[2][2] != 0:
            if show:
                color = CIRC_COLOR if self.quadrados[1][1] == 2 else CRUZ_COLOR
                iPos = (20, 20)
                fPos = (LARGURA - 20, ALTURA - 20)
                pg.draw.line(screen, color, iPos, fPos, CRUZ_LARGURA)
            return self.quadrados[1][1]

        # asc diagonal
        if self.quadrados[2][0] == self.quadrados[1][1] == self.quadrados[0][2] != 0:
            if show:
                color = CIRC_COLOR if self.quadrados[1][1] == 2 else CRUZ_COLOR
                iPos = (20, ALTURA - 20)
                fPos = (LARGURA - 20, 20)
                pg.draw.line(screen, color, iPos, fPos, CRUZ_LARGURA)
            return self.quadrados[1][1]

        # Sem vitoria ainda
        return 0

    def marcar_quadrados(self, linha, coluna, jogador):
        self.quadrados[linha][coluna] = jogador
        self.quadrados_marcados += 1

    def quadrados_vazios(self, linha, coluna):
        return self.quadrados[linha][coluna] == 0

    def get_quadrados_vazios(self):
        vazios = []
        for linha in range(LINHAS):
            for coluna in range(COLUNAS):
                if self.quadrados_vazios(linha, coluna):
                    vazios.append( (linha, coluna) )
        
        return vazios

    def tabuleiro_cheio(self):
        return self.quadrados_marcados == 9

    def tabuleiro_vazio(self):
        return self.quadrados_marcados == 0

class Bot:

    def __init__(self, comportamento=1, jogador=2):
        self.comportamento = comportamento
        self.jogador = jogador

    # Algoritmo Minimax

    def minimax(self, Tabuleiro, maximizando):
        
        # Casos terminais
        caso = Tabuleiro.fim_de_jogo()

        # jogador 1 vence
        if caso == 1:
            return 1, None # eval, movimento

        # jogador 2 vence
        if caso == 2:
            return -1, None

        # empate
        elif Tabuleiro.tabuleiro_cheio():
            return 0, None

        if maximizando:
            max_eval = -100
            best_move = None
            quadrados_vazios = Tabuleiro.get_quadrados_vazios()

            for (linha, coluna) in quadrados_vazios:
                temp_Tabuleiro = copy.deepcopy(Tabuleiro)
                temp_Tabuleiro.marcar_quadrados(linha, coluna, 1)
                eval = self.minimax(temp_Tabuleiro, False)[0]
                if eval > max_eval:
                    max_eval = eval
                    best_move = (linha, coluna)

            return max_eval, best_move

        elif not maximizando:
            min_eval = 100
            best_move = None
            quadrados_vazios = Tabuleiro.get_quadrados_vazios()

            for (linha, coluna) in quadrados_vazios:
                temp_Tabuleiro = copy.deepcopy(Tabuleiro)
                temp_Tabuleiro.marcar_quadrados(linha, coluna, self.jogador)
                eval = self.minimax(temp_Tabuleiro, True)[0]
                if eval < min_eval:
                    min_eval = eval
                    best_move = (linha, coluna)

            return min_eval, best_move

    # Avaliacao do Bot

    def eval(self, tabuleiro):
        if self.comportamento == 0:
            # Escolha Aleatoria
            eval = 'aleatorio'
            quadrados_vazios = tabuleiro.get_quadrados_vazios()

            movimento = random.randrange(0, len(quadrados_vazios))
        else:
            # Minimax decisao
            eval, movimento = self.minimax(tabuleiro, False)

        print(f'Bot escolheu a pos {movimento} com o valor de: {eval}')

        return [movimento,eval] # linha, coluna

class Jogo:

    def __init__(self):
        self.Tabuleiro = Tabuleiro()
        self.Bot = Bot()
        self.jogador = 1   #1 Cruz #2 Circulos
        self.modo = 'Bot' # pvp or Bot
        self.jogando = True
        self.criar_divisas()

    def criar_divisas(self):
        # bg
        screen.fill( BG_COLOR )

        # vertical
        pg.draw.line(screen, LINHA_COLOR, (TAMANHOQUADRADO, 0), (TAMANHOQUADRADO, ALTURA), LINHA_LARGURA)
        pg.draw.line(screen, LINHA_COLOR, (LARGURA - TAMANHOQUADRADO, 0), (LARGURA - TAMANHOQUADRADO, ALTURA), LINHA_LARGURA)

        # horizontal
        pg.draw.line(screen, LINHA_COLOR, (0, TAMANHOQUADRADO), (LARGURA, TAMANHOQUADRADO), LINHA_LARGURA)
        pg.draw.line(screen, LINHA_COLOR, (0, ALTURA - TAMANHOQUADRADO), (LARGURA, ALTURA - TAMANHOQUADRADO), LINHA_LARGURA)

    def desenhar(self, linha, coluna):
        if self.jogador == 1:
            # desenhar cruz
            # linha descendente
            start_desc = (coluna * TAMANHOQUADRADO + OFFSET, linha * TAMANHOQUADRADO + OFFSET)
            end_desc = (coluna * TAMANHOQUADRADO + TAMANHOQUADRADO - OFFSET, linha * TAMANHOQUADRADO + TAMANHOQUADRADO - OFFSET)
            pg.draw.line(screen, CRUZ_COLOR, start_desc, end_desc, CRUZ_LARGURA)
            # linha ascendente
            start_asc = (coluna * TAMANHOQUADRADO + OFFSET, linha * TAMANHOQUADRADO + TAMANHOQUADRADO - OFFSET)
            end_asc = (coluna * TAMANHOQUADRADO + TAMANHOQUADRADO - OFFSET, linha * TAMANHOQUADRADO + OFFSET)
            pg.draw.line(screen, CRUZ_COLOR, start_asc, end_asc, CRUZ_LARGURA)
        
        elif self.jogador == 2:
            # desenhar circulo
            center = (coluna * TAMANHOQUADRADO + TAMANHOQUADRADO // 2, linha * TAMANHOQUADRADO + TAMANHOQUADRADO // 2)
            pg.draw.circle(screen, CIRC_COLOR, center, RAIO, CIRC_LARGURA)

   # Marca o quadrado correspondente com o simbolo do jogador na lista, desenha no pygame e troca de turno

    def jogada(self, linha, coluna):
        self.Tabuleiro.marcar_quadrados(linha, coluna, self.jogador)
        self.desenhar(linha, coluna)
        self.trocar_turno()

    def trocar_turno(self):
        if self.jogador == 1:
            self.jogador = 2
        elif self.jogador == 2:
            self.jogador = 1

    def trocar_modo(self):
        self.modo = 'Bot' if self.modo == 'pvp' else 'pvp'

    def fim(self):
        return self.Tabuleiro.fim_de_jogo(show=True) != 0 or self.Tabuleiro.tabuleiro_cheio()

    def reiniciar(self):
        self.__init__()

def jogar(modo):

    jogo = Jogo()
    jogo.modo = modo
    Tabuleiro = jogo.Tabuleiro
    Bot = jogo.Bot

    valor = 0

    while True:
        
        mouse_pos = pg.mouse.get_pos()

        RESET_BTN = Botao(pg.image.load('Trabalho_Final/assets/reset_btn.png'),(LARGURA-16,16),'R',pg.font.SysFont('freesansbold.ttf',32),'#eff9d6','#ba5044')

        RESET_BTN.mudarCor(mouse_pos)
        RESET_BTN.atualizar(screen)

        for event in pg.event.get():

            if event.type == pg.QUIT:
                pg.quit()
                sys.exit()

            # Jogar
            if event.type == pg.MOUSEBUTTONDOWN and event.button == 1:
                pos = event.pos
                linha = pos[1] // TAMANHOQUADRADO
                coluna = pos[0] // TAMANHOQUADRADO
                
                # Jogador marca quadrado e checa se o jogo acabou
                if Tabuleiro.quadrados_vazios(linha, coluna) and jogo.jogando:
                    jogo.jogada(linha, coluna)

                    if jogo.fim():
                        jogo.jogando = False

                # Reiniciar jogo
                if RESET_BTN.checarInteracao(mouse_pos):
                    jogo.reiniciar()
                    Tabuleiro = jogo.Tabuleiro
                    Bot = jogo.Bot



        # Chamada do objeto Bot
        if jogo.modo == 'Bot' and jogo.jogador == Bot.jogador and jogo.jogando:

            pg.display.update()

            # Avaliar jogada
            linha, coluna= Bot.eval(Tabuleiro)[0]
            valor = Bot.eval(Tabuleiro)[1]
            jogo.jogada(linha, coluna)

            valor_btn = Botao(pg.image.load('Trabalho_Final/assets/reset_btn.png'),(0+16,16),f'{valor}',pg.font.SysFont('freesansbold.ttf',32),'#eff9d6','#ba5044')
            valor_btn.atualizar(screen)

            if jogo.fim():
                jogo.jogando = False


        if jogo.fim():
            FIM = font.render('FIM DE JOGO', True, '#eff9d6')
            opac = pg.Surface((LARGURA,ALTURA/2.5))
            opac.fill((64,64,64))
            screen.blit(opac,(0,ALTURA/2-ALTURA/8))
            screen.blit(FIM,(LARGURA/3.1,ALTURA/2.1))

            MENU_BTN = Botao(pg.image.load('Trabalho_Final/assets/bg_btn.png'),(0+86,ALTURA/1.5),'MENU',font,'#eff9d6','#ba5044')
            R_BTN = Botao(pg.image.load('Trabalho_Final/assets/bg_btn.png'),(LARGURA/2,ALTURA/1.5),'RESET',font,'#eff9d6','#ba5044')
            QUIT_BTN = Botao(pg.image.load('Trabalho_Final/assets/bg_btn.png'),(LARGURA-86,ALTURA/1.5),'SAIR',font,'#eff9d6','#ba5044')

            for botao in [MENU_BTN,R_BTN,QUIT_BTN]:
                botao.mudarCor(mouse_pos)
                botao.atualizar(screen)
            
            for event in pg.event.get():
                
                if event.type == pg.QUIT:
                    pg.quit()
                    sys.exit()

                if event.type == pg.MOUSEBUTTONDOWN and event.button == 1:
                    if R_BTN.checarInteracao(mouse_pos):
                        jogo.reiniciar()
                        Tabuleiro = jogo.Tabuleiro
                        Bot = jogo.Bot
                    
                    if MENU_BTN.checarInteracao(mouse_pos):
                        menu_inicial()
                    
                    if QUIT_BTN.checarInteracao(mouse_pos):
                        pg.quit()
                        sys.exit()


        
        pg.display.update()

def menu_inicial():

    screen.fill( BG_COLOR )

    while True:
        
        # criacao dos botoes de menu
        mouse_pos = pg.mouse.get_pos()

        TITULO = font.render('JOGO DA VELHA', True, '#eff9d6')
        TITULO_LABEL = TITULO.get_rect(center=(LARGURA/2,ALTURA/3.5))

        PVP_BTN = Botao(pg.image.load('Trabalho_Final/assets/bg_btn.png'),(LARGURA/2,ALTURA/1.87),'PvP',font,'#eff9d6','#ba5044')
        PVE_BTN = Botao(pg.image.load('Trabalho_Final/assets/bg_btn.png'),(LARGURA/2,ALTURA/1.42),'PvE',font,'#eff9d6','#ba5044')
        QUIT_BTN = Botao(pg.image.load('Trabalho_Final/assets/bg_btn.png'),(LARGURA/2,ALTURA/1.145),'SAIR',font,'#eff9d6','#ba5044')

        screen.blit(TITULO,TITULO_LABEL)

        for botao in [PVP_BTN,PVE_BTN,QUIT_BTN]:
            botao.mudarCor(mouse_pos)
            botao.atualizar(screen)

        # Detectar acoes no pygame
        for event in pg.event.get():

            # Sair janela
            if event.type == pg.QUIT:
                pg.quit()
                sys.exit()

            if event.type == pg.MOUSEBUTTONDOWN and event.button == 1:
                # Jogador vs Jogador
                if PVP_BTN.checarInteracao(mouse_pos):
                    jogar('pvp')
                # Jogador vs Bot (algoritmo minimax)
                if PVE_BTN.checarInteracao(mouse_pos):
                    jogar('Bot')
                # Botao sair
                if QUIT_BTN.checarInteracao(mouse_pos):
                    pg.quit()
                    sys.exit()

        pg.display.update()

menu_inicial()
