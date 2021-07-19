extends Node2D

# 0: Nucleo, 1: Complexo de golgi, 2: Cloroplastos
# 3: Lisossomos, 4: Mitocondria, 5: Peroxissomos, 6: REL, 7: RER, 8: Ribossomos, 
# 9: Proteína, 10: Vacuolo, 11: Filamentos, 12: Microfilamentos, 13: Microtubulos

func _ready():
	pass # Replace with function body.

func _on_close_pressed():
	get_node('/root/Node2D/organelas').visible = false
	get_tree().paused = false

func toggle_visibility(id, aux):
	get_node("Control/ScrollContainer/VBoxContainer/Control" + str(id)).visible = aux

##### Manipulação para adição do núcleo
func _add_nucleo():
	add_organela(0)

##### Manipulação para adição do Complexo de golgi
func _add_complexo_golgi():
	add_organela(1)

##### Manipulação para adição do Cloroplastos
func _add_cloroplasto():
	add_organela(2)

##### Manipulação para adição de lisossomo
func _add_lisossomo():
	add_organela(3)

##### Manipulação para adição de Mitocondria
func _add_mitocondria():
	add_organela(4)

##### Manipulação para adição do Peroxissomo
func _add_peroxissomo():
	add_organela(5)

##### Manipulação para adição do Retículo Endoplasmático Liso
func _add_ret_end_liso():
	add_organela(6)

##### Manipulação para adição do Retículo Endoplasmático Rugoso
func _add_ret_end_rugoso():
	add_organela(7)

##### Manipulação para adição de Ribossomos
func _add_ribossomo():
	add_organela(8)

##### Manipulação para adição de Vacuolo
func _add_vacuolo():
	add_organela(9)

##### Manipulação para adição de Proteína
func _add_proteina():
	add_organela(10)

##### Manipulação para adição de Filamentos
func _add_filamentos():
	add_organela(11)

##### Manipulação para adição de Microfilamentos
func _add_microfilamentos():
	add_organela(12)

##### Manipulação para adição de Microtubulos
func _add_microtubulos():
	add_organela(13)

func add_organela(index):
	get_node('/root/Node2D').cells[get_node('/root/Node2D').selected_cell]._add_organelle(index)
	_on_close_pressed()
