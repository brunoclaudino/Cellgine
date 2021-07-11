extends Node
#Lista de ações que vai ser executadas
var lista = []                                                                  # recebe as ações pra ser executados em ordem te tempo
var timer

func _ready():
	pass

func add_lista(organela, tipo, tempo):
	lista.append([organela, tipo, tempo])                                       # Add na lista
	lista.sort_custom(ordenador_custom, "ordenar_cresc")                        # Chama ordenador customizado
	print(lista)                                                                # Printa a lista na ordem
	
class ordenador_custom:                                                         # Classe de ordenação customizada do array
	static func ordenar_cresc(a, b):                                            # Func que ordena em ordem crescente
		if a[2] < b[2]:                                                         # Usa o terceiro atributo do array, ou seja, o tempo
			return true
		return false

func executar(tempMax):                                                         # Func chamada quando for executado a simulação (em tese)
	timer = iniciar_timer(tempMax)
	while timer.time_left() <= lista[-1][2]:
		if not timer.is_stopped():
			if lista[1][1] == 1:
				print('Operação 1')

func iniciar_timer(tempMax):
	timer = get_tree().create_timer(tempMax)
	timer.set_wait_time(10)
	yield(timer,"timeout")

func div_celular(inicial):
	var pos_inici = inicial.get_position()                                          # Posição em que começou a se dividir
	var duplicata                                     # Nova celula
	add_child(duplicata)                                                        # Adiciona ela ao mesmo pai da original
	duplicata.membr_invisivel()                                                 # Deixa a membrana da célula invisivel
	var i = 0
	inicial.anima_divisao()
	while i < 20:
		yield(get_tree().create_timer(0.1), "timeout")
		i+=1
	inicial.mudar_pos(pos_inici, -300, 0)
	duplicata.mudar_pos(pos_inici, 300, 0)
	inicial.voltar_textura()
	duplicata.voltar_textura()                                                  # Deixa a membrana visivel
	duplicata.estruturas = inicial.copiar_estruturas()
	duplicata.construir_estruturas()

func bomba_na_cl(celula):
	pass

func secre_vesicula(celula):
	pass
