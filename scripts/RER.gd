extends Node2D

var posicao_pai                          # Em tese vai armazenar a posição do ponto central do pai
var id
var nome = 'Retículo Endoplasmático Rugoso (R.E.R)'
var resumo = 'Simtee de proteínas. Se localiza muito próximo do R.E.L. Faz a produção de Lisossomos'
var descricao = ['Possui esse nome por ter diversos ribossomos aderidos em sua parede. Por isso o R.E.R faz síntese de proteínas. Porém a maioria é enviada para o complexo de Golgi para ser redirecionado para fora da célula. R.E.R é comum em células de secreção.',
'Fica muito próximo ao R.E.L. Porém o R.E.R fica mais próximo do núcleo',
'Produz Lisossomos']
# Variáveis para fazer a caixa de descrição das organelas aparecer
var mouse_entrou = false
var caixa_descricao
var podefazer = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if mouse_entrou and Input.is_action_pressed("left_click"):
		if podefazer:
			caixa_descricao = load('res://scenes/CaixaInfo.tscn')
			var temp = caixa_descricao.instance()
			temp.seta_info(nome, resumo, descricao)
			temp.scale = Vector2(1.5, 1.5)
			add_child(temp)
			print('Criou Caixa')
			podefazer = false

func define_id(numero):
	self.id = numero
	
func em_mitose():
	pass

func define_posicao_pai(numero):
	self.posicao_pai = numero


func _on_Area2D_mouse_entered():
	mouse_entrou = true


func _on_Area2D_mouse_exited():
	mouse_entrou = false
