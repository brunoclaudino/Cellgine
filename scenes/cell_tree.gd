extends Control

var expanded = preload("res://assets/img/open.png")
var collapsed = preload("res://assets/img/closed.png")
var expandedState = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_expand_pressed():
	match(expandedState):
		true: 
			$HBoxContainer/expand.set_normal_texture(collapsed)
			$VBoxContainer.set_visible(false)
		false: 
			$HBoxContainer/expand.set_normal_texture(expanded)
			$VBoxContainer.set_visible(true)
	expandedState = !expandedState


func _on_plus_pressed():
	get_node('/root/Node2D/organelas').visible = true
