extends Node2D

var posicao_pai                          # Em tese vai armazenar a posição do ponto central do pai
var id
var nome = 'Retículo Endoplasmático Rugoso (R.E.R)'
var resumo = 'Simtee de proteínas. Se localiza muito próximo do R.E.L. Faz a produção de Lisossomos'
var descricao = ['Possui esse nome por ter diversos ribossomos aderidos em sua parede. Por isso o R.E.R faz síntese de proteínas. Porém a maioria é enviada para o complexo de Golgi para ser redirecionado para fora da célula. R.E.R é comum em células de secreção.',
'Fica muito próximo ao R.E.L. Porém o R.E.R fica mais próximo do núcleo',
'Produz Lisossomos']
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
