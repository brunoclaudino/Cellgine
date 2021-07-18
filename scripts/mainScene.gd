extends Node2D

var cell_tree = preload("res://scenes/cell_tree.tscn")

var cells = []
var celula = preload("res://scenes/Celula.tscn")

var cells_count = 0
var selected_cell = -1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func divisao_celular(inicial):                                                  # Procedimento de divisão
	var pos_inici = inicial.get_position()                                      # Posição em que começou a se dividir
	var duplicata = celula.instance()                                           # Nova celula
	$simulationPanel.add_child(duplicata)                                                        # Adiciona ela ao mesmo pai da original
	duplicata.membr_invisivel()                                                 # Deixa a membrana da célula invisivel
	duplicata.get_child(1).scale.x = 0.45
	duplicata.get_child(1).scale.y = 0.45
	var i = 0
	inicial.anima_divisao()
	while i < 20:
		yield(get_tree().create_timer(0.1), "timeout")
		i+=1
	inicial.mudar_pos(pos_inici, -250, 0)
	duplicata.mudar_pos(pos_inici, 250, 0)
	inicial.voltar_textura()
	duplicata.voltar_textura()                                                  # Deixa a membrana visivel
	duplicata.estruturas = inicial.copiar_estruturas()
	duplicata.construir_estruturas()


func _on_newCell_pressed():
	cells.append(cell_tree.instance())
	cells.back().get_child(0).get_child(1).set_text(str("Célula ", cells.size()))
	cells.back().id = cells_count
	cells.back().rect_size.x = $myCells/Control/ScrollContainer.rect_size.x
	$myCells/Control/ScrollContainer/VBoxContainer.add_child(cells.back())
	cells.back().cell = celula.instance()
	$simulationPanel.add_child(cells.back().cell)
	cells.back().cell.scale.x = 0.45
	cells.back().cell.scale.y = 0.45
	#cells.back().cell.get_child(13).scale.y = 0.45
	#cells.back().cell.get_child(13).scale.x = 0.45
	$simulationPanel.get_child(0).mudar_pos(Vector2(100, 100), 450, 150)
	cells_count = cells_count + 1
	


func _on_newSimulation_pressed():
	divisao_celular(cells.back().cell)
