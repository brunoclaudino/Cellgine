extends Node2D

var spt #= preload('') lembrar de passar o sprite quando tiver
var posicao_pai                          # Em tese vai armazenar a posição do ponto central do pai
var id
var nome = 'Microfilamento'
var resumo = 'Formado por actina. Formação dos pseudópodes e microvilosidades.'
var descricao = ['É formado por uma proteínas chamada actína.',
'Graças a essas estruturas é que acontece a contração muscular, isso é chamado de movimento celular.',
'A junção da actina e miosina formam o movimento celular.',
' Formam os pseudópodes',
'Ajudam no movimento de Ciclose onde os cloroplasto se arrumam para captar maiores fontes de luz',
'Formam Microvilosidades que aumentam a superfície de contato para melhor absorção do intestino']


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = spt
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func define_id(numero):
	self.id = numero
	
func em_mitose():
	pass

func define_posicao_pai(numero):
	self.posicao_pai = numero
