extends Node2D

var posicao_pai                          # Em tese vai armazenar a posição do ponto central do pai
var id
var nome = 'Cloroplastos'
var resumo = 'Fotossíntese'
var descricao = ['Achado em céulas de algas e plantas', 'Cloroplastos é o mais famoso dos plastos por apresentear a pigmentação verde e ser responsável pela fotossíntese.']
# Variáveis para fazer a caixa de descrição das organelas aparecer
var caixa_descricao = preload('res://scenes/CaixaInfo.tscn')
var podefazer = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func define_id(numero):
	self.id = numero
	
func em_mitose():
	pass

func define_posicao_pai(numero):
	self.posicao_pai = numero

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		if podefazer:
			var temp = caixa_descricao.instance()
			temp.seta_info(nome, resumo, descricao)
			temp.scale = Vector2(1.5, 1.5)
			add_child(temp)
			print('Criou Caixa')
			podefazer = false
