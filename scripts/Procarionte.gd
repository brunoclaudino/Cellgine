extends Node2D

var lista = preload("res://scripts/ActionList.gd")

# DNA, Plasmídeos, Ribossomos
var estruturas = [0, 0, 0]                        # Guarda quais e quantas estruturas tem
#var p = protein.instance()
var mouse_entrou = false
var drag_enabled = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event : InputEvent):
	if event is InputEventMouseButton:
		if event.is_pressed(): 
			if event.button_index == BUTTON_WHEEL_UP: # zoom in
				self.scale += Vector2(0.1, 0.1)
				# call the zoom function
			if event.button_index == BUTTON_WHEEL_DOWN: # zoom out
				self.scale -= Vector2(0.1, 0.1)
				# call the zoom function
	if mouse_entrou && Input.is_action_pressed("left_click"):
		self.position = event.position
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

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


func _on_Area2D_mouse_entered():
	mouse_entrou = true


func _on_Area2D_mouse_exited():
	mouse_entrou = false
