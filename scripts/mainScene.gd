extends Node2D

var cell_tree = preload("res://scenes/cell_tree.tscn")

var funcs = preload("res://scenes/Funcs.tscn")
var cells = []
var celula_eucarionte = preload("res://scenes/Celula.tscn")
var celula_procarionte = preload("res://scenes/Procarionte.tscn")
var funcoes = funcs.instance()
var selected_cell = -1
# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(funcoes)

# Método que adiciona uma nova célula na cena
func _on_newCell_pressed():
	$novaCelula.visible = true
	get_tree().paused = true

func _addCell(type1, type2):
	cells.append(cell_tree.instance())
	cells.back().get_child(0).get_child(1).set_text(str("Célula ", cells.size()))
	cells.back().id = cells.size() - 1
	cells.back().type1 = type1
	cells.back().type2 = type2
	cells.back().rect_size.x = $myCells/Control/ScrollContainer.rect_size.x
	$myCells/Control/ScrollContainer/VBoxContainer.add_child(cells.back())
	if(type1 == "eucarionte"):
		cells.back().cell = celula_eucarionte.instance()
		### Em tese, a parede vegetal deveria ser adicionada aqui
		if(type2 == "vegetal"):
			cells.back().cell.get_node("ParedeCelular").visible = true
	else:
		cells.back().cell = celula_procarionte.instance()
	$simulationPanel.add_child(cells.back().cell)
	cells.back().cell.scale.x = 0.45
	cells.back().cell.scale.y = 0.45
	$simulationPanel.get_child(0).mudar_pos(Vector2(100, 100), 450, 150)

# Método que remove uma célula da cena, a qual corresponde ao id recebido por parâmetro
func _remove_cell(id):
	if id != cells.size() - 1:
		for i in range(id + 1, cells.size()):
			cells[i].id = cells[i].id - 1
	cells[id].cell.free()
	cells[id].queue_free()
	cells.remove(id)

# Ordem dos itens em estruturas:
# 0: Nucleo, 1: Complexo de golgi, 2: Cloroplastos
# 3: Lisossomos, 4: Mitocondria, 5: Peroxissomos, 6: REL, 7: RER, 8: Ribossomos, 
# 9: Vacuolo, 10: Proteína, 11: Filamentos, 12: Microfilamentos, 13: Microtubulos
func _mostrar_acoes():
	if cells[selected_cell].type1 == "eucarionte":
		$acoes._mostrar_empacot_prot(cells[selected_cell].cell.estruturas[1] > 0)
		$acoes. _mostrar_bomba_sodio_potassio(cells[selected_cell].cell.estruturas[10] > 0)
		$acoes.visible = true
	get_tree().paused = true

# Ordem dos itens em estruturas de uma célula eucarionte:
# 0: Nucleo, 1: Complexo de golgi, 2: Cloroplastos
# 3: Lisossomos, 4: Mitocondria, 5: Peroxissomos, 6: REL, 7: RER, 8: Ribossomos, 
# 9: Vacuolo, 10: Proteína, 11: Filamentos, 12: Microfilamentos, 13: Microtubulos
# Ordem dos itens em estruturas de uma célula procarionte:
# 0: DNA, 1: Plasmídeos, 2: Ribossomos
func _adicionar_organela():
	# Colocar filtragem para organelas de célula procarionte
	if cells[selected_cell].type1 == "eucarionte":
		for i in range(0, cells[selected_cell].cell.estruturas.size()):
			$organelas.toggle_visibility(i, cells[selected_cell].cell.estruturas[i] == 0)
		$organelas.visible = true
		get_tree().paused = true
