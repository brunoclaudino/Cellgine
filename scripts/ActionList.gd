extends Node

var lista = []                                # Vetor de vetores que receberá as ações pra ser executados em ordem te tempo
var executando = true
var tempo_execucao = 0

func _ready():
	pass

func add_lista(organela, tipo, tempo):
	lista.append([organela, tipo, tempo])                                       # Add na lista
	lista.sort_custom(ordenador_curtom, "ordenar_cresc")                        # Chama ordenador customizado
	print(lista)                                                                # Printa a lista na ordem
	
class ordenador_curtom:                                                         # Classe de ordenação customizada do array
	static func ordenar_cresc(a, b):                                            # Func que ordena em ordem crescente
		if a[2] < b[2]:                                                         # Usa o terceiro atributo do array, ou seja, o tempo
			return true
		return false

func executar():                                                                # Func chamada quando for executado a simulação (em tese)
	var i = 0
	while executando and tempo_execucao < lista.back()[2]:
		if lista[1][1] == 1:
			print('Operação 1')
