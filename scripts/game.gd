extends Node2D

# Máquina de estados
enum {wait, move}
var state

var estruturas = [0, 1, 2, 4]  
# var estruturas = [0, 1, 2, 4, 6, 7]  

# Array que armazena todas as peças do jogo
var all_pieces = []

# Primeira peça que o usuário tocou
var first_piece_touched = Vector2(0, 0)

# Última peça que o usuário tocou
var last_piece_touched = Vector2(0, 0)

# Variáveis do grid
var controlling = false

# Usado para buscar os números presentes em uma string
var regex = RegEx.new()

# Grid de jogo
var height = 8
var width = 16

var celula = preload("res://scenes/Celula.tscn")

# Variáveis para o swap back
var piece_one = null
var piece_two = null
var last_place = Vector2(0, 0)
var last_direction = Vector2(0, 0)
var move_checked = false

func _ready():
	state = move
	randomize()
	set_process(true)
	regex.compile("[0-9]+")
	all_pieces = create_array()
	create_pieces()

func create_array():
	var array = []
	for i in range (0, height):
		array.append([])
		for _j in range(0, width):
			array[i].append(null)
	return array

func create_pieces():
	for i in range(0, height):
		for j in range(0, width):
			var random = floor(rand_range(0, estruturas.size()))
			var loops = 0
			while(match_at(i, j, estruturas[random]) and loops < 100):
				random = floor(rand_range(0, estruturas.size()))
				loops += 1
			get_node("grid/" + str(i) + "-" + str(j)).add_estrutura(estruturas[random])
			get_node("grid/" + str(i) + "-" + str(j)).construir_estruturas()
			all_pieces[i][j] = get_node("grid/" + str(i) + "-" + str(j))

func match_at(row, column, organelle):
	if column > 1:
		if all_pieces[row][column-1] != null && all_pieces[row][column-2] != null:
			if all_pieces[row][column-1].get_estruturas()[0] == organelle and all_pieces[row][column-2].get_estruturas()[0] == organelle:
				return true
	if row > 1:
		if all_pieces[row-1][column] != null && all_pieces[row-2][column] != null:
			if all_pieces[row-1][column].get_estruturas()[0] == organelle and all_pieces[row-2][column].get_estruturas()[0] == organelle:
				return true
	return false

func touch_input():
	var shapes = get_world_2d().direct_space_state.intersect_point(get_global_mouse_position(), 32, [], 0x7FFFFFFF, true, true) # The last 'true' enables Area2D intersections, previous four values are all defaults
	if Input.is_action_just_pressed("left_click"):
		if shapes.size() > 0:
			first_piece_touched = pixel_to_grid($grid.get_local_mouse_position().x, $grid.get_local_mouse_position().y)
			controlling = true
	if Input.is_action_just_released("left_click"):
		if shapes.size() > 0 and controlling:
			controlling = false
			last_piece_touched = pixel_to_grid($grid.get_local_mouse_position().x, $grid.get_local_mouse_position().y)
			touch_difference(first_piece_touched,last_piece_touched)
		else:
			controlling = false

func swap_pieces(row, column, direction):
	var first_cell = all_pieces[row][column]
	var other_cell = all_pieces[row + direction.x][column + direction.y]
	if first_cell != null and other_cell != null:
		store_info(first_cell, other_cell, Vector2(row, column), direction)
		state = wait
		all_pieces[row][column] = other_cell
		all_pieces[row + direction.x][column + direction.y] = first_cell
		var aux = first_cell.position
		first_cell.move(other_cell.position)
		other_cell.move(aux)
		if not move_checked:
			find_matches()
			$movimentos/Control/qntdmov.text = str(int($movimentos/Control/qntdmov.text) - 1) 

func store_info(first_piece, other_piece, place, direction):
	piece_one = first_piece
	piece_two = other_piece
	last_direction = direction
	last_place = place

func touch_difference(grid_1, grid_2):
	var difference = grid_2 - grid_1
	if abs(difference.x) > abs(difference.y):
		if difference.x > 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(1, 0))
		elif difference.x < 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(-1, 0))
	elif abs(difference.y) > abs(difference.x):
		if difference.y > 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(0, 1))
		elif difference.y < 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(0, -1))

func _physics_process(_delta):
	if state == move:
		touch_input()

func find_matches():
	for i in height:
		for j in width:
			if all_pieces[i][j] != null:
				var current_organelle = all_pieces[i][j].get_estruturas()[0]
				if i > 0 and i < height - 1:
					if all_pieces[i-1][j] != null and all_pieces[i + 1][j] != null:
						if all_pieces[i - 1][j].get_estruturas()[0] == current_organelle and all_pieces[i + 1][j].get_estruturas()[0] == current_organelle:
							dim(all_pieces[i - 1][j])
							dim(all_pieces[i][j])
							dim(all_pieces[i + 1][j])
				if j > 0 and j < width - 1:
					if all_pieces[i][j - 1] != null and all_pieces[i][j + 1] != null:
						if all_pieces[i][j - 1].get_estruturas()[0] == current_organelle and all_pieces[i][j + 1].get_estruturas()[0] == current_organelle:
							dim(all_pieces[i][j - 1])
							dim(all_pieces[i][j])
							dim(all_pieces[i][j + 1])
	$destroy_timer.start()

func destroy_matched():
	var was_matched = false
	for i in height:
		for j in width:
			if all_pieces[i][j] != null:
				if all_pieces[i][j].modulate == Color(1, 1, 1, .5):
					was_matched = true
					all_pieces[i][j].queue_free()
					all_pieces[i][j] = null
					$pontuacao/Control/qntdPontos.text = str(int($pontuacao/Control/qntdPontos.text) + 25)
	move_checked = true
	if was_matched:
		$collapse.start()
	else:
		swipe_back()

func dim(cell):
	cell.modulate = Color(1, 1, 1, .5)

func _on_destroy_timer_timeout():
	destroy_matched()

func collapse_columns():
	for i in range(height-1, -1, -1):
		for j in width:
			if all_pieces[i][j] == null:
				for k in range(i - 1, -1, -1):
					if all_pieces[k][j] != null:
						all_pieces[k][j].move(grid_to_pixel(i, j))
						all_pieces[i][j] = all_pieces[k][j]
						all_pieces[k][j] = null
						break
	$refil_timer.start()

func grid_to_pixel(row, column):
	var col = 58 + 79 * column
	var line = 37 + 73 * row
	return Vector2(col, line)

func pixel_to_grid(pixel_x, pixel_y):
	var new_x = round((pixel_y - 37) / 73)
	var new_y = round((pixel_x - 58) / 79)
	return Vector2(new_x, new_y);

func _on_collapse_timeout():
	collapse_columns()

func _on_refil_timer_timeout():
	refil_columns()

func refil_columns():
	for i in range(0, height):
		for j in range(0, width):
			if all_pieces[i][j] == null:
				var random = floor(rand_range(0, estruturas.size()))
				var loops = 0
				while(match_at(i, j, estruturas[random]) and loops < 100):
					random = floor(rand_range(0, estruturas.size()))
					loops += 1
				var cell = celula.instance()
				cell.scale = Vector2(0.07, 0.07)
				cell.allow_movement = false
				cell.allow_zoom = false
				cell.resize_organelles = false
				cell.center_organelle = true
				cell.show_info_box = false
				cell.add_estrutura(estruturas[random])
				cell.construir_estruturas()
				$grid.add_child(cell)
				cell.position = grid_to_pixel(i - 2, j)
				cell.move(grid_to_pixel(i, j))
				all_pieces[i][j] = cell
	_after_refil()

# Função para verificar se algum match surgiu após preencher os locais vazios 
# com novas células
func _after_refil():
	for i in height:
		for j in width:
			if all_pieces[i][j] != null:
				if match_at(i, j, all_pieces[i][j].get_estruturas()[0]):
					find_matches()
					$destroy_timer.start()
					return
	state = move
	move_checked = false

# Desfaz o movimento das peças, caso um match não seja encontrado
func swipe_back():
	if piece_one != null and piece_two != null:
		swap_pieces(last_place.x, last_place.y, last_direction)
	move_checked = false
	state = move

func end_game(result):
	pass
