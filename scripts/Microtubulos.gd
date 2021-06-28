extends Node2D

var posicao_pai                          # Em tese vai armazenar a posição do ponto central do pai
var id
var nome = 'Microtubulos'
var resumo = 'Fazem a sustentação da célula. Além disso formam os centríolos que vao formar os fusos para a divisão celular ou formar cílios e flagelos da células.'
var descricao = ['Formado por uma proteína globular chamado Tubulina',
'Faz sustentação da célula',
'Usando 9 grupos de 3 microtubulos cada grupo, são formados centríolos.',
'Os centríolos por sua vez, são usados para formar os fusos meiótico e mitótico que serão usados na divisão celular.',
'Os centríolos também podem formar os cílios e flagelos usados para a locomoção de algumas células.']


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func define_id(numero):
	self.id = numero
	
func em_mitose():
	pass

func define_posicao_pai(numero):
	self.posicao_pai = numero
