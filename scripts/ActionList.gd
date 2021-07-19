extends Node
#Lista de ações que vai ser executadas
var lista = []                                                                  # recebe as ações pra ser executados em ordem te tempo
var timer

func _ready():
	pass

func add_lista(organela, tipo, tempo):
	lista.append([organela, tipo, tempo])                                       # Add na lista
	lista.sort_custom(ordenador_custom, "ordenar_cresc")                        # Chama ordenador customizado
	# print(lista)                                                              # Printa a lista na ordem
	
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



func _nova_div_celular():
	var cell = get_node('/root/Node2D').cells[get_node('/root/Node2D').selected_cell].cell
	_on_close_pressed()
	get_node('/root/Node2D').funcoes.div_celular(cell)


func _nova_bomba_NaK():
	var cell = get_node('/root/Node2D').cells[get_node('/root/Node2D').selected_cell].cell
	_on_close_pressed()
	get_node('/root/Node2D').funcoes.bomba_na_cl(cell, 2)


func _nova_endocitose():
	var cell = get_node('/root/Node2D').cells[get_node('/root/Node2D').selected_cell].cell
	_on_close_pressed()
	get_node('/root/Node2D').funcoes.exocitose(cell)


func _nova_exocitose():
	pass # Replace with function body.


func _on_close_pressed():
	get_node('/root/Node2D/acoes').visible = false
	get_tree().paused = false

func _mostrar_empacot_prot(aux):
	$Control/ScrollContainer/VBoxContainer/Control5.visible = aux


func _mostrar_bomba_sodio_potassio(aux):
	$Control/ScrollContainer/VBoxContainer/Control2.visible = aux


func _novo_empacot_prot():
	pass # Replace with function body.
