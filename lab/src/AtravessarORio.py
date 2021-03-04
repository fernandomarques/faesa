lado1 = []
lado2 = []
mapa = {
    "rio": '''
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                           O  o
                      _\_   o
            >('>   \\/  o\ .
                   //\___=
                      ''
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'''
}
#### Dicas uteis
#  Para adicionar um item na lista : lista.append(item). Exemplo lado1.append("Galinha")
#  Para remover um item da lista: lista.remove(item). Exemplo lado1.remove("Galinha")


def iniciar_jogo():
    """
    Função que inicializa e reseta o jogo
    :return:
    """
    # Limpar as listas
    lado1.clear()
    lado2.clear()
    # Preencher o lado
    lado1.append("Alface")
    lado1.append("Galinha")
    lado1.append("Lobo")
    lado1.append("Barco")


def desenhar_jogo():
    print(lado1)
    print(mapa['rio'])
    print(lado2)


def mover(origem, destino, animal):
# exemplo de uso: mover(lado1,lado2,"Galinha")
    # Verificar se o barco está na origem
    # Verificar se o animal está na origem
    
    ##########    OBSERVAÇÃO!!!     ########
    # É possível mover só o barco sem animal dentro!
    # Para isso podemos fazer chamar mover(lado2,lado1,"Barco")
    # ATENÇÃO! Antes de tirar animal da origem e colocar no destino, verifique se não é o barco
    
    pass #apagar isso


def ganhou():
    # Verificar se o jogador ganhou
    # Galinha, Lobo e Alface no lado2
    if "Galinha" in lado2 and "Lobo" in lado2 and "Alface" in lado2:
        return True
    else:
        return False

def perdeu():
    # Verificar se o jogador perdeu
    # Situação 1: Apenas Galinha e Lobo
    # Situação 2: Apenas Galinha e Alface
    return False #apagar isso

iniciar_jogo()

# Continua enquanto o jogador não tiver ganho nem perdido
while not ganhou() and not perdeu():
    # Imprimir o jogo
    desenhar_jogo()
    # Perguntar ao jogador o próximo movimento
    animal=input("Qual animal você vai mover? Digite apenas 'Barco' se deseja voltar o barco")
    # Mover o objeto
    if "Barco" in lado1:
        mover(lado1,lado2,animal)
    else:
        mover(lado2,lado1,animal)
    
# Ao terminar, verificar se o jogador ganhou ou perdeu e imprimir a mensagem relacionada
if ganhou():
    print("Parabens! Você ganhou o jogo!")
else:
    print("Não foi desta vez...")