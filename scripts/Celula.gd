extends Node2D

var protein = preload("res://scenes/Proteina.tscn")
var lista = preload("res://scripts/ActionList.gd")

#lita de caminhos para fazer load nas estruturas sem ter que deixar tudo em preload
var inst_organ = ["res://scenes/Nucleo.tscn", "res://scenes/Golgi.tscn", "res://scenes/Cloroplastos.tscn", 
"res://scenes/Lisossomos.tscn", "res://scenes/Mitocondria.tscn", "res://scenes/Peroxissomos.tscn",
"res://scenes/REL.tscn", "res://scenes/RER.tscn", "res://scenes/Ribossomos.tscn", "res://scenes/Vacuolo.tscn", 
"res://scenes/Filamentos.tscn", "res://scenes/Microfilamento.tscn", "res://scenes/Microtubulos.tscn"]

# Nucleo, golgi, cloroplastos, Lisossomos, Mitocondria, Peroxissomos, REL, RER, Ribossomos, Proteína, Vacuolo
# Filamentos, Microfilamentos, Microtubulos
var estruturas = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]                        # Guarda quais e quantas estruturas tem

var selected = false
var mouse_in = false

func _ready():
	var temp = lista.new()                                                      # Testando add coisas na lista
	temp.add_lista(1,3,55)
	temp.add_lista(1, 2, 15)
	temp.add_lista(2, 5, 75)
	temp.add_lista(3, 1, 5)

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

func anima_divisao():
	$Membrana.play("division", false)
	
func construir_estruturas():                                                    # Func para colocar as organelas
	var i = 0
	while i<13:
		if estruturas[i] > 0:
			carregar_estrutura(i)
		i+=1

func get_golgi_pos():
	return $Golgi.position

func carregar_estrutura(index):                                                 # Switch para chamada de criação de organelas
	print("--- Estruturas presentes na célula")
	match index:
		0:
			var nucleo = load('res://scenes/Nucleo.tscn')
			var temp = nucleo.instance()
			add_child(temp)
			temp.position = $Nucleo.position
			temp.scale = Vector2(0.2, 0.2)
			print("Núcleo adicionado")
		1:
			var golgi = load('res://scenes/Golgi.tscn')
			var temp = golgi.instance()
			add_child(temp)
			temp.position = $Golgi.position
			temp.scale = Vector2(0.2, 0.2)
			print("Complexo de Golgi adicionado")
		2:
			var clorop = load('res://scenes/Cloroplastos.tscn')
			var temp = clorop.instance()
			add_child(temp)
			temp.position = $Cloroplastos.position
			temp.scale = Vector2(0.15, 0.15)
			print("Cloroplasto adicionado")
		3:
			var liso = load('res://scenes/Lisossomos.tscn')
			var temp = liso.instance()
			add_child(temp)
			temp.position = $Lisossomos.position
			print("Lisossomo adicionado")
		4:
			var mito = load('res://scenes/Mitocondria.tscn')
			var temp = mito.instance()
			add_child(temp)
			temp.position = $Mitocondria.position
			temp.scale = Vector2(0.1, 0.1)
			print("Mitocondria adicionada")
		5:
			var peri = load('res://scenes/Peroxissomos.tscn')
			var temp = peri.instance()
			add_child(temp)
			temp.position = $Peroxissomos.position
			print("Peroxissomo adicionado")
		6:
			var rel = load('res://scenes/REL.tscn')
			var temp = rel.instance()
			add_child(temp)
			temp.position = $REL.position
			temp.scale = Vector2(0.2, 0.2)
			print("Retículo Endoplasmático Liso adicionado")
		7:
			var rer = load('res://scenes/RER.tscn')
			var temp = rer.instance()
			add_child(temp)
			temp.position = $RER.position
			temp.scale = Vector2(0.2, 0.2)
			print("Retículo Endoplasmático Rugoso adicionado")
		8:
			var ribo = load('res://scenes/Ribossomos.tscn')
			var temp = ribo.instance()
			add_child(temp)
			temp.position = $Ribossomos.position
			print("Ribossomo adicionado")
		9:
			var vac = load('res://scenes/Vacuolo.tscn')
			var temp = vac.instance()
			add_child(temp)
			temp.scale = Vector2(0.3, 0.3)
			temp.position = $Vacuolo.position
			print("Vacúolo adicionado")
		10:
			var temp = protein.instance()
			add_child(temp)
			temp.position = $Proteina.position
			print("Proteína adicionada")
		11:
			var dna = load('res://scenes/DNA.tscn')
			var temp = dna.instance()
			add_child(temp)
			temp.scale = Vector2(0.08, 0.08)
			temp.position = $Nucleo.position
			print("DNA adicionada")
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
