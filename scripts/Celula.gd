extends Node

var organela = preload("res://scenes/Organelas.tscn")
var lista = preload("res://scripts/ActionList.gd")
var celula = preload("res://scenes/Celula.tscn")
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

func divisao_celular():
	var pos_centro = $
