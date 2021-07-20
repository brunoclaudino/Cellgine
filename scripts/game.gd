extends Node2D

var estruturas = [0, 1, 2, 4, 6, 7]  
var all_pieces

# Primeira peça que o usuário tocou
var first_piece_touched = Vector2(0, 0)

# Última peça que o usuário tocou
var last_piece_touched = Vector2(0, 0)

func _ready():
	randomize()
	all_pieces = create_array()
	create_pieces()

func create_array():
	var array = []
	for i in range (0, 8):
		array.append([])
		for j in range(0, get_node("line" + str(i+1)).get_child_count()):
			array[i].append(null)
	return array

func create_pieces():
	for i in range (0, 8):
		for j in range(0, get_node("line" + str(i+1)).get_child_count()):
			var random = floor(rand_range(0, estruturas.size()))
			var loops = 0
			while(match_at(i, j, estruturas[random]) and loops < 100):
				random = floor(rand_range(0, estruturas.size()))
				loops += 1
			get_node("line" + str(i+1)).get_child(j).add_estrutura(estruturas[random])
			get_node("line" + str(i+1)).get_child(j).construir_estruturas()
			all_pieces[i][j] = estruturas[random]

func match_at(column, row, organelle):
	if column > 1:
		if all_pieces[column-1][row] != null && all_pieces[column-2][row] != null:
			if all_pieces[column-1][row] == organelle and all_pieces[column-2][row] == organelle:
				return true
	if row > 1:
		if all_pieces[column][row-1] != null && all_pieces[column][row-2] != null:
			if all_pieces[column][row-1] == organelle and all_pieces[column][row-1] == organelle:
				return true

func touch_input():
	if Input.is_action_just_pressed("left_click"):
		first_piece_touched = get_global_mouse_position()
	if Input.is_action_just_released("left_click"):
		last_piece_touched = get_global_mouse_position()
