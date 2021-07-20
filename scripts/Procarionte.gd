extends Node2D

var lista = preload("res://scripts/ActionList.gd")

# DNA, Plasmídeos, Ribossomos
var estruturas = [0, 0, 0]                        # Guarda quais e quantas estruturas tem
#var p = protein.instance()
var selected = false
var mouse_in = false

func voltar_textura():                                                          # Volta a textura para a default
	$Membrana.play("default", false)
	#p.visivel()

func mudar_pos(inicial, altX, altY):                                            # Método para mudar posição mais facilmente por de fora da célula
	var temp = inicial
	temp += Vector2(altX, altY)
	self.position = temp

func membr_invisivel():                                                         # Muda para uma animação sem textura
	$Membrana.play("invisivel", false)
	#p.invisivel()

func add_estrutura(index):
	estruturas[index] += 1

func copiar_estruturas():
	return estruturas.duplicate()

func construir_estruturas():                                                    # Func para colocar as organelas
	var i = 0
	while i<13:
		if estruturas[i] > 0:
			carregar_estrutura(i)
		i+=1

func carregar_estrutura(index):                                                 # Switch para chamada de criação de organelas
	print("--- Estruturas presentes na célula")
	match index:
		0:
			var nucleo = load('res://scenes/Nucleo.tscn')
			var temp = nucleo.instance()
			add_child(temp)
			temp.position = $Nucleo.position
			temp.get_child(0).scale.y = 0.3
			temp.get_child(0).scale.x = 0.3
			temp.get_child(1).get_child(0).scale.y = 0.3
			temp.get_child(1).get_child(0).scale.x = 0.3
			print("Núcleo adicionado")
		8:
			var ribo = load('res://scenes/Ribossomos.tscn')
			var temp = ribo.instance()
			add_child(temp)
			temp.position = $Position2D.position + Vector2(-20, 0)
			print("Ribossomo adicionado")
		9:
			var vac = load('res://scenes/Vacuolo.tscn')
			var temp = vac.instance()
			add_child(temp)
			temp.position = $Vacuolo.position
			print("Vacúolo adicionado")
		11:
			pass
		12:
			pass
		_:
			print("Valor inesperado de index de estrutura")


# Movimentação da célula

var grabbed_offset = Vector2()

func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("left_click"):
		grabbed_offset = global_position - get_global_mouse_position()

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position() + grabbed_offset, 25 * delta)

func on_click():
	selected = true

func _input(event : InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed() and mouse_in: 
			if event.button_index == BUTTON_WHEEL_UP: # zoom in
				self.scale += Vector2(0.1, 0.1)
				# call the zoom function
			if event.button_index == BUTTON_WHEEL_DOWN: # zoom out
				self.scale -= Vector2(0.1, 0.1)
				# call the zoom function
		elif event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false


func _on_Area2D_mouse_entered():
	mouse_in = true


func _on_Area2D_mouse_exited():
	mouse_in = false
