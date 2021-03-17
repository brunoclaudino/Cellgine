extends Node

var textura = preload("res://icon.png")
var id
var nome
var descri


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = textura
	

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
