extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_close_pressed():
	get_node('/root/Node2D/organelas').visible = false

func _add_cloroplasto():
	add_organela(2)

func _add_mitocondria():
	add_organela(4)

func _add_memb_nucl():
	pass # Replace with function body.

func _add_lisossomo():
	add_organela(3)

func _add_ret_end_rugo():
	add_organela(7)

func _add_ret_end_liso():
	add_organela(6)

func __add_comp_golgi():
	add_organela(1)

func _add_vacuolo():
	add_organela(9)

func _add_peroxissomo():
	add_organela(5)

func _add_plasmideo():
	pass # Replace with function body.

func _add_na_mais():
	pass # Replace with function body.

func _add_cl_menos():
	pass # Replace with function body.

func _add_k():
	pass # Replace with function body.

func _add_p():
	pass # Replace with function body.

func _add_dna():
	pass # Replace with function body.

func add_organela(index):
	get_node('/root/Node2D').cells[get_node('/root/Node2D').selected_cell]._add_organelle(index)
	_on_close_pressed()
