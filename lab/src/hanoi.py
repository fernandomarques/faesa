Pilha_A = []
Pilha_B = []
Pilha_C = []
A = "A"
B = "B"
C = "C"
def desenhar():
    tamanho = max(len(Pilha_A), len(Pilha_B), len(Pilha_C))
    pilhas = [Pilha_A,Pilha_B,Pilha_C]
    print("{:^20s} | {:^20s} | {:^20s}".format("Pilha A", "Pilha B", "Pilha C"))
    for i in range(tamanho,-1,-1):
        line = ""
        pilha_var = []
        for pilha in pilhas:
            if i >= len(pilha):
                pilha_var.append(" ")
            else:   
                disco = pilha[i]
                pilha_var.append("="*disco)
        print("{:^20s} | {:^20s} | {:^20s}".format(pilha_var[0],pilha_var[1],pilha_var[2]))

def mover(de,para):
    mapa = {'A': 0, 'a':0,'B':1,'b':1,'C':2,'c':2}
    pilhas = [Pilha_A,Pilha_B,Pilha_C]
    if len(pilhas[mapa[para]]) == 0:
        disco = pilhas[mapa.get(de)].pop()
        pilhas[mapa.get(para)].append(disco)
    elif pilhas[mapa.get(de)][-1] > pilhas[mapa.get(para)][-1]:
        print("Movimento Ilegal")
    else:
        disco = pilhas[mapa.get(de)].pop()
        pilhas[mapa.get(para)].append(disco)
    if(len(Pilha_A) + len(Pilha_B) == 0):
        ganhou()

def ganhou():
    print("PARABENS!!! VOCE GANHOU!!!")
    print("Iniciando um novo jogo")
    jogo()

def jogo():
    Pilha_A.clear()
    Pilha_B.clear()
    Pilha_C.clear()
    size = int(input("Qual o tamanho das máximo?"))
    for i in range(size,0,-1):
        Pilha_A.append(i)
    print(Pilha_A)
    desenhar()

jogo()