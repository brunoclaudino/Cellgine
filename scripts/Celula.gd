extends Node

var organela = preload("res://scenes/Organelas.tscn")
var raio = 100
var y = 0.0
var x = 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	gerar_membrana()


func gerar_membrana():
	var i = 0
	while i < 250:
		y = sqrt((raio*raio + x*x))
		var temp = organela.instance()
		get_parent().add_child(temp)
		temp.position.y = y
		temp.position.x = x
		x += 0.4
		i += 1

