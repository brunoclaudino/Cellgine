extends Node

var protein = preload("res://scenes/proteina.tscn")
var lista = preload("res://scripts/ActionList.gd")

#lita de caminhos para fazer load nas estruturas sem ter que deixar tudo em preload
var inst_organ = ["res://scenes/Nucleo.tscn", "res://scenes/Golgi.tscn", "res://scenes/Cloroplastos.tscn", 
"res://scenes/Lisossomos.tscn", "res://scenes/Mitocondria.tscn", "res://scenes/Peroxissomos.tscn",
"res://scenes/REL.tscn", "res://scenes/RER.tscn", "res://scenes/Ribossomos.tscn", "res://scenes/Vacuolo.tscn", 
"res://scenes/Filamentos.tscn", "res://scenes/Microfilamento.tscn", "res://scenes/Microtubulos.tscn"]

# Nucleo, golgi, cloroplastos, Lisossomos, Mitocondria, Peroxissomos, REL, RER, Ribossomos, Vacuolo
# Filamentos, Microfilamentos, Microtubulos
var estruturas = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]                        # Guarda quais e quantas estruturas tem
var p = protein.instance()
var mouse_entrou = false


func _ready():
	$Membrana.add_child(p)
	p.position = $Position2D.position + Vector2(-475,0)                         # Seta a posição da proteína
	var temp = lista.new()                                                      # Testando add coisas na lista
	temp.add_lista(1,3,55)
	temp.add_lista(1, 2, 15)
	temp.add_lista(2, 5, 75)
	temp.add_lista(3, 1, 5)

func _process(delta):
	if mouse_entrou && Input.is_action_pressed("left_click"):
		self.position = get_viewport().get_mouse_position()
	else:
		if Input.is_action_just_pressed("left_click"):
			self.scale += Vector2(0.1, 0.1)

func voltar_textura():                                                          # Volta a textura para a default
	$Membrana.play("default", false)
	p.visivel()

func mudar_pos(inicial, altX, altY):                                            # Método para mudar posição mais facilmente por de fora da célula
	var temp = inicial
	temp += Vector2(altX, altY)
	self.position = temp

func membr_invisivel():                                                         # Muda para uma animação sem textura
	$Membrana.play("invisivel", false)
	p.invisivel()

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
			print("Núcleo adicionado")
		1:
			var golgi = load('res://scenes/Golgi.tscn')
			var temp = golgi.instance()
			add_child(temp)
			temp.position = $Golgi.position
			temp.get_child(0).scale.y = 0.3
			temp.get_child(0).scale.x = 0.3
			print("Complexo de Golgi adicionado")
		2:
			var clorop = load('res://scenes/Cloroplastos.tscn')
			var temp = clorop.instance()
			add_child(temp)
			temp.position = $Cloroplastos.position
			temp.get_child(0).scale.y = 0.2
			temp.get_child(0).scale.x = 0.2
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
			temp.get_child(0).scale.y = 0.09
			temp.get_child(0).scale.x = 0.09
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
			temp.get_child(0).scale.y = 0.3
			temp.get_child(0).scale.x = 0.3
			print("Retículo Endoplasmático Liso adicionado")
		7:
			var rer = load('res://scenes/RER.tscn')
			var temp = rer.instance()
			add_child(temp)
			temp.position = $RER.position
			temp.get_child(0).scale.y = 0.3
			temp.get_child(0).scale.x = 0.3
			print("Retículo Endoplasmático Rugoso adicionado")
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
		10:
			pass
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
