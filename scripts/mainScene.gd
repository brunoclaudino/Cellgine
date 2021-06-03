extends Node2D

var cell_tree = preload("res://scenes/cell_tree.tscn")

var cells = []
var celula = preload("res://scenes/Celula.tscn")

var cells_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_newCell_pressed():
	cells.append(cell_tree.instance())
	cells.back().get_child(0).get_child(1).set_text(str("Célula ", cells.size()))
	cells.back().rect_size.x = $myCells/Control/ScrollContainer.rect_size.x
	$myCells/Control/ScrollContainer/VBoxContainer.add_child(cells.back())
	cells_count = cells_count + 1
	$simulationPanel.add_child(celula.instance())
	$simulationPanel.get_child(0).mudar_pos(Vector2(200, 200), 0, 0)
