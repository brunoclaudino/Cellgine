extends Control

var expanded = preload("res://assets/img/open.png")
var collapsed = preload("res://assets/img/closed.png")
var tree_item = preload("res://scenes/TreeItem.tscn")
var expandedState = false
var id
var cell
var item_id = 1
var theme_item = preload("res://assets/styles/treeItemSelected.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	var popup = $HBox/Margin/HBox/extraOptions.get_popup()
	popup.add_item("Adicionar ação")
	popup.add_item("Remover célula")
	popup.connect("id_pressed", self, "_on_item_click")
	# popup.connect("id_pressed", self, "_on_item_pressed")

func _add_organelle(index):
	cell.add_estrutura(index)
	cell.construir_estruturas()
	$VBox.add_child(tree_item.instance())
	$VBox.get_child($VBox.get_child_count() - 1).item_id = item_id
	$VBox.visible = expandedState
	#if item_id == 1:
	#	$VBox.get_child($VBox.get_child_count() - 1).get_child(0).get_child(0).set("custom_styles/normal", theme_item)
	#	$VBox.get_child($VBox.get_child_count() - 1).get_child(0).get_child(0).flat = false
	item_id += 1
	match index:
		0:
			$VBox.get_child($VBox.get_child_count() - 1).get_child(0).get_child(0).text = "Núcleo"
		1:
			$VBox.get_child($VBox.get_child_count() - 1).get_child(0).get_child(0).text = "Complexo de Golgi"
		2:
			$VBox.get_child($VBox.get_child_count() - 1).get_child(0).get_child(0).text = "Cloroplasto"
		3:
			$VBox.get_child($VBox.get_child_count() - 1).get_child(0).get_child(0).text = "Lisossomo"
		4:
			$VBox.get_child($VBox.get_child_count() - 1).get_child(0).get_child(0).text = "Mitocôndria"
		5:
			$VBox.get_child($VBox.get_child_count() - 1).get_child(0).get_child(0).text = "Peroxissomo"
		6:
			$VBox.get_child($VBox.get_child_count() - 1).get_child(0).get_child(0).text = "Ret. End. Liso"
		7:
			$VBox.get_child($VBox.get_child_count() - 1).get_child(0).get_child(0).text = "Ret. End. Rugoso"
		8:
			$VBox.get_child($VBox.get_child_count() - 1).get_child(0).get_child(0).text = "Ribossomo"
		9:
			$VBox.get_child($VBox.get_child_count() - 1).get_child(0).get_child(0).text = "Vacúolo"
		10:
			pass
		11:
			pass
		12:
			pass
		_:
			print("Valor inesperado de index de estrutura")

func _on_expand_pressed():
	match(expandedState):
		true: 
			$HBox/expand.set_normal_texture(collapsed)
			$VBox.set_visible(false)
		false: 
			$HBox/expand.set_normal_texture(expanded)
			$VBox.set_visible(true)
	expandedState = !expandedState


func _on_plus_pressed():
	get_node('/root/Node2D/organelas').visible = true
	get_node('/root/Node2D').selected_cell = id

func _on_item_click(click_id):
	match(click_id):
		0:
			pass
		1:
			get_node('/root/Node2D')._remove_cell(id)
