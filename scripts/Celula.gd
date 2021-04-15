extends Node

var organela = preload("res://scenes/Organelas.tscn")
var lista = preload("res://scripts/ActionList.gd")
var celula = preload("res://scenes/Celula.tscn")
var inst_organ = ["res://scenes/Nucleo.tscn", "res://scenes/Golgi.tscn", "res://scenes/Cloroplastos.tscn", 
"res://scenes/Lisossomos.tscn", "res://scenes/Mitocondria.tscn", "res://scenes/Peroxissomos.tscn",
"res://scenes/REL.tscn", "res://scenes/RER.tscn", "res://scenes/Ribossomos.tscn", "res://scenes/Vacuolo.tscn", 
"res://scenes/Filamentos.tscn", "res://scenes/Microfilamento.tscn", "res://scenes/Microtubulos.tscn"]

# Nucleo, golgi, cloroplastos, Lisossomos, Mitocondria, Peroxissomos, REL, RER, Ribossomos, Vacuolo
# Filamentos, Microfilamentos, Microtubulos
var estruturas = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
var textura_membrana
var raio = 300
var y = 0.0
var x = 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	var temp = lista.new()
	temp.add_lista(1,3,55)
	temp.add_lista(1, 2, 15)
	temp.add_lista(2, 5, 75)
	temp.add_lista(3, 1, 5)
	gerar_membrana()


func gerar_membrana():
	var i = 0
	while i < 10:
		y = sqrt((raio*raio + x*x))
		var temp = organela.instance()
		add_child(temp)
		temp.set_position(Vector2((700+x), y))
		temp = organela.instance()
		add_child(temp)
		temp.set_position(Vector2((700-x), y))
		temp = organela.instance()
		add_child(temp)
		temp.set_position(Vector2((700-x), 2*raio-y))
		temp = organela.instance()
		add_child(temp)
		temp.set_position(Vector2((700+x), 2*raio-y))
		x += 30
		i += 1

func divisao_celular():                                                         # Procedimento de divisão
	var pos_inici = Vector2($Position2D.position.x, $Position2D.position.y)     # Posição em que começou a se dividir
	var duplicata = celula.instance()                                           # Nova celula
	self.get_parent().add_child(duplicata)                                      # Adiciona ela ao mesmo pai da original
	self.mudar_pos(pos_inici, -100, 0)                                          # Mudar a posição para a esquerda
	duplicata.mudar_pos(pos_inici, 100, 0)                                      # Muda a posição antes de deixar visivel
	duplicata.inserir_membrana()                                                # Deixa a membrana visivel

func voltar_textura():                                                          # Volta a textura para a default
	pass

func mudar_pos(inicial, altX, altY):                                            # Método para mudar posição mais facilmente por de fora da célula
	var temp = inicial
	temp.position.x += altX
	temp.position.y += altY
	self.set_position = temp

func inserir_membrana():                                                        # Deixa a membrana visivel
	$Membrana.texture = textura_membrana

func add_estruturas():
	var i = 0
	while i<13:
		if estruturas[i] > 0:
			carregar_estrutura(0)
		i+=1

func carregar_estrutura(index):
	match index:
		0:
			pass
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
		6:
			pass
		7:
			pass
		8:
			pass
		9:
			pass
		10:
			pass
		11:
			pass
		12:
			pass
		_:
			print("Valor inesperado de index de estrutura")
