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
var y = 0.0
var x = 0.0


func _ready():
	$Membrana.add_child(p)
	p.position = $Position2D.position + Vector2(-750,0)
	var temp = lista.new()                                                      # Testando add coisas na lista
	temp.add_lista(1,3,55)
	temp.add_lista(1, 2, 15)
	temp.add_lista(2, 5, 75)
	temp.add_lista(3, 1, 5)

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
	
func construir_estruturas():                                                    # Func para colocar as organelas
	var i = 0
	while i<13:
		if estruturas[i] > 0:
			carregar_estrutura(0)
		i+=1

func carregar_estrutura(index):                                                 # Switch para chamada de criação de organelas
	match index:
		0:
			var nucleo = load('res://scenes/Nucleo.tscn')
			var temp = nucleo.instance()
			add_child(temp)
			temp.position = $Position2D.position
		1:
			var golgi = load('res://scenes/Golgi.tscn')
			var temp = golgi.instance()
			add_child(temp)
			temp.position = $Position2D.position + Vector2(0, 250)
		2:
			var clorop = load('res://scenes/Cloroplastos.tscn')
			var temp = clorop.instance()
			add_child(temp)
			temp.position = $Position2D.position + Vector2(0, 250)
		3:
			var liso = load('res://scenes/Lisossomos.tscn')
			var temp = liso.instance()
			add_child(temp)
			temp.position = $Position2D.position + Vector2(200, 200)
		4:
			var mito = load('res://scenes/Mitocondria.tscn')
			var temp = mito.instance()
			add_child(temp)
			temp.position = $Position2D.position + Vector2(-100, -300)
		5:
			var peri = load('res://scenes/Peroxissomos.tscn')
			var temp = peri.instance()
			add_child(temp)
			temp.position = $Position2D.position + Vector2(-300, -300)
		6:
			var rel = load('res://scenes/REL.tscn')
			var temp = rel.instance()
			add_child(temp)
			temp.position = $Position2D.position + Vector2(100, 300)
		7:
			var rer = load('res://scenes/RER.tscn')
			var temp = rer.instance()
			add_child(temp)
			temp.position = $Position2D.position + Vector2(-200, 300)
		8:
			var ribo = load('res://scenes/Ribossomos.tscn')
			var temp = ribo.instance()
			add_child(temp)
			temp.position = $Position2D.position + Vector2(-100, 0)
		9:
			var vac = load('res://scenes/Vacuolo.tscn')
			var temp = vac.instance()
			add_child(temp)
			temp.position = $Position2D.position + Vector2(200, 200)
		10:
			pass
		11:
			pass
		12:
			pass
		_:
			print("Valor inesperado de index de estrutura")
