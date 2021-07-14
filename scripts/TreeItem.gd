extends MarginContainer

var item_id
var theme_item = preload("res://assets/styles/treeItemSelected.tres")


func _ready():
	pass # Replace with function body.

func _on_cellName_pressed():
	print("Cliquei!!")
	$Control/cellName.flat = false
	$Control/cellName.set("custom_styles/normal", theme_item)
