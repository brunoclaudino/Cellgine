extends Node2D

var spt #= preload('') lembrar de passar o sprite quando tiver
var posicao_pai                          # Em tese vai armazenar a posição do ponto central do pai
var id
var nome = 'Vacúolo'
var resumo = 'Reserva de substâncias. Regulação osmótica'
var descricao = ['Principal função dos vacúolos é a regulação osmótiva',
'Reserva de substâncias da céula vegetal',
'Uma célula jovem possui vários vacúolos pequenos que se juntam formando um vacúolo enorme quando a célula amadurece']


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
