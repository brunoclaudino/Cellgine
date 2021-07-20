extends Node2D


var selectedTheme = preload("res://assets/styles/ButtonSelectedStyle.tres")
var normalTheme = preload("res://assets/styles/ButtonNormalStyle.tres")
var firstSelection = "none"
var secondSelection = "none"

func _ready():
	pass # Replace with function body.

func _on_procarionte_pressed():
	firstSelection = "procarionte"
	$procarionte.set("custom_styles/normal", selectedTheme)
	$eucarionte.set("custom_styles/normal", normalTheme)
	$animal.visible = false
	$vegetal.visible = false
	$animal.set("custom_styles/normal", normalTheme)
	$vegetal.set("custom_styles/normal", normalTheme)
	secondSelection = "none"


func _on_eucarionte_pressed():
	firstSelection = "eucarionte"
	$procarionte.set("custom_styles/normal", normalTheme)
	$eucarionte.set("custom_styles/normal",selectedTheme)
	$animal.visible = true
	$vegetal.visible = true


func _on_animal_pressed():
	secondSelection = "animal"
	$animal.set("custom_styles/normal", selectedTheme)
	$vegetal.set("custom_styles/normal", normalTheme)


func _on_vegetal_pressed():
	secondSelection = "vegetal"
	$animal.set("custom_styles/normal", normalTheme)
	$vegetal.set("custom_styles/normal", selectedTheme)
	


func _on_adicionar_pressed():
	if firstSelection == "none" or (firstSelection == "eucarionte" and secondSelection == "none"):
		var dialog = AcceptDialog.new()
		dialog.dialog_text = "Indique corretamente o tipo de célula que deseja adicionar a simulação"
		dialog.window_title = "Erro!"
		dialog.connect('modal_closed', dialog, 'queue_free')
		get_parent().add_child(dialog)
		dialog.popup_centered()
	else:
		get_node('/root/Node2D')._addCell(firstSelection, secondSelection)
		_on_close_pressed()


func _on_close_pressed():
	get_node('/root/Node2D/novaCelula').visible = false
	firstSelection = "none"
	secondSelection = "none"
	$procarionte.set("custom_styles/normal", normalTheme)
	$eucarionte.set("custom_styles/normal", normalTheme)
	$animal.set("custom_styles/normal", normalTheme)
	$vegetal.set("custom_styles/normal", normalTheme)
