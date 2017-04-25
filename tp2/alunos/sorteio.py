import random


def main():
	alunos = ["Allex", "Igor", "Johelen","Juliana", "Leonardo",
		"Lucas Aleixo", "Marcos", "Paulo"]
	_alunos = alunos[:]
	while(True):
		if _alunos == []:
			_alunos = alunos[:]
		aluno = random.choice(_alunos)
		_alunos.remove(aluno)
		print(aluno)
		a = input("")
		if a == 'q':
			return

if __name__ == "__main__":
	main()