extends Node2D

var posicao_pai                          # Em tese vai armazenar a posição do ponto central do pai
var id
var nome = 'Retículo Endoplasmático Liso (R.E.L)'
var resumo = 'Síntese de Gordura (lipídios). Processar óleos, fosfolipídeos e esteróides.'
var descricao = ['Principal função é a sintese de lipídeos.',
'Podem processar óleos, fosfolipídeos e esteróides (Hormônios sexuais)',
'Paredes mais tubolares',
'Quebra do alcool']
# Variáveis para fazer a caixa de descrição das organelas aparecer
var caixa_descricao = preload('res://scenes/CaixaInfo.tscn')


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
		var temp = caixa_descricao.instance()
		temp.seta_info(nome, resumo, descricao)
		temp.scale = Vector2(0.5, 0.5)
		temp.position = self.position
		get_parent().add_child(temp)
		print('Criou Caixa')
