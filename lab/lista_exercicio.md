# Lista de Exercícios


## Estrutura Sequencial
1. Faça um código que pergunte o nome do usuário e imprima "Olá {fulano}, eu me chamo Python!" 
1. Imprima na tela o valor de 21 / 6, observe o valor da variável resposta
1. Imprima na tela o valor de 24 / 6, observe o valor da variável resposta 
1. Faça um programa que leia dois números inteiros e imprima os dois números
1. Faça um programa que leia dois números inteiros e imprima a soma dos dois
1. Faça um programa que leia dois números inteiros e imprima a média dos dois
1. Faça um programa que leia dois números inteiros e imprima a média ponderada dos dois, considere os pesos 3 e 4
1. Faça um programa que leia dois números inteiros e imprima a média ponderada dos dois, pergunte os pesos ao usuário
2. Faça um programa que leia um valor em graus fahrenheit e imprima o valor convertido em celsius
4. Faça um código que pergunte a altura e peso do usuário e imprima o IMC.

*Bônus*: 
1. No turtle, desenhe uma estrela 
2. No turtle, desenhe um smile 
3. No turtle, desenhe a bandeira do Brasil
 
## Estrutura Condicional (if)
1. Faça um código para ler um número e imprimi-lo caso seja múltiplo de 5
3. Faça um programa que leia dois números e imprima o maior deles
4. Faça um código que leia dois números inteiros, efetue a adição e caso o resultado seja maior ou igual a 10 imprima "Soma maior ou igual a 10"
5. Faça um código que leia dois números inteiros, efetue a adição e caso o resultado seja maior que 20 imprima o valor somado a 8
6. Faça um código que leia um número inteiro e imprima "É múltiplo de 3" ou "Não é múltiplo de 3".
7. Faça um código que leia um número e informar se ele é divisível por 10, por 7, por 5, por 3, por 2 ou se não é divisível por nenhum destes.
8. Faça um código que leia a altura e peso do usuário, calcule IMC e imprima a facha do peso. (Até 18.5 abaixo do peso, de 18.5 até 25 peso normal, de 25 até até 30 acima do peso e acima de 30 obeso)
9. Faça um programa que leia três números e imprima o maior deles.
10. Faça um programa que leia três notas e imprima: "Aprovado", se a nota for maior ou igual a sete. "Prova Final", se a nota for menor que 7. 
11. Faça um programa para ler o salário bruto e imprima o valor devido do imposto. Salário Bruto * Alíquota - Valor a deduzir

Faixa | Alíquota | Valor a Deduzir
--- | --- | ---
Até 1903,98 | Isento | 0
De 1903,99 até 2826,65 | 7% | R$ 142,80 
De 2826,66 até 3751,05 | 15% |R$ 354,80 
De 3751,06 até 4664,68 | 22.5%| R$ 636,13
Acima de 4664,68 | 27,5% | R$ 869,36

## Estrutura de Repetição Condicional (while)
1. Faça um código que leia uma nota mas só aceite valores acima ou igual a 0 e menores ou iguais a 10. Imprima "Valor Inválido" ou o valor
2. Faça um código que leia uma altura mas só aceite valores maiores que 0 e menores que 3. Imprima "Valor Inválido" ou o valor
3. Leia duas notas de um aluno, informe a sua média. Seu programa deve forçar ao usuário a digitar notas na faixa de 0 a 10, informando "Valor inválido" no caso de nota inválida.
4. Faça um código que leia valores até que seja digitado 0. Imprima quantos itens foram lidos e qual a média dos valores
5. Faça um código que leia valores até que seja digitado 0. Imprima o maior valor digitado
6. Faça um código que leia valores até que seja digitado 0. Imprima o menor valor digitado
7. Faça um código que leia idades até que seja digitado 0. Imprima quantas idades maiores ou iguais a 18 foram digitadas
8. Faça um código que leia idades até que seja digitado 0. Calcule a média de idades de quem possui mais que 21 anos e imprima
9. Vamos fazer um sistema de ingressos de Cinema. Pergunte a idade até que a pessoa digite 0 para sair. Se a pessoa tiver menos que 10 anos ou mais que 60 informe "Meia Entrada" se não, informe "Inteira". Ao terminar imprima: "Total de x ingressos vendidos, sendo y meia entrada" 


10. Vamos fazer um menu de caixa eletrônico, executando em loop até que o usuário peça para sair. Suponha que o saldo inicial seja R$1000. O usuário deverá digitar qual item do menu para prossegir.
Imprima: """  
1 - Ver saldo  
2 - Sacar dinheiro  
3 - Depositar dinheiro  
4 - Sair  
"""
 * Caso o usuário digite 1 imprima o saldo atual
 * Caso o usuário digite 2 pergunte quanto dinheiro ele deseja sacar e remova do saldo (atenção, o usuário não pode sacar mais do que possui!)
 * Caso o usuário digite 3 pergunte quanto dinheiro ele deseja depositar e adicione o valor ao saldo
 * Caso o usuário digite 4 encerre o programa
 * Caso o usuário digite outro valor no menu apresente a mensagem "Opção Inválida" e imprima o menu novamente. 
 * Tente fazer a primeira vez usando if e a segunda usando match case (python 3.10)
## Estrutura de Repetição Contada (for)
1. Faça um código que conte de 0 até 10 imprimindo na tele
2. Faça um código que conte de 10 até 1 imprimindo na tela
3. Faça um código que conte de -10 até 10 imprimindo na tela
4. Faça um código que imprima todos os números pares até 100
5. Faça um código que imprima todos os números primos de 2 até 100
6. Faça um código que leia um número e imprima a tabuada do número de 1 a 9
7. Faça um código, usando dois loops for, que imprima o triangulo abaixo, dica: procure pelo parametro end do print    
9 8 7 6 5 4 3 2 1   
8 7 6 5 4 3 2 1   
7 6 5 4 3 2 1  
6 5 4 3 2 1   
5 4 3 2 1   
4 3 2 1   
3 2 1   
2 1   
1   
8. Faça um programa que faça um cronometro imprimindo minutos e segundos. Dica: procure pela função sleep da biblioteca os
9. Faça um programa que leia um valor inteiro N calcule a soma da série: S = 1/1 + 1/2 + 1/3 + 1/4 + ... + 1/N 
10. A fórmula de Leibniz pode ser utilizada para calcular um valor aproximado de Pi. Faça um código que leia um valor N e calcule o valor de Pi seguindo a série: Pi = 4 * ( 1 - 1/3 + 1/5 - 1/7 + 1/9 ...). Dica: para inverter o sinal você pode usar (-1) elevado a N


*Bônus*:
1. Faça o exemplo no (https://groklearning.com/csedweek/hoc-snowflake-blockly/)[link]


## Listas 

## Desafios dos alunos
1. Para formarmos um triângulo utilizamos a seguinte regra: um dos lados deve ser maior que o valor absoluto da diferença dos outros dois lados e menor que a soma dos outros dois lados. Tendo essa regra em mente, implemente um programa que leia três valores, valide o triângulo e classifique-o em Isósceles, Equilátero ou Escaleno. (Felipe Leoncio, Ciência da Computação 2022.1)
2. 
