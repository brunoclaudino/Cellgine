extends Polygon2D

var info = []
var pagina = 0
var mouse_entrou = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$BotaoVoltar.visible = false
	$Voltar.visible = false
	#$Resumo/Nome.ALIGN_CENTER = true
	#$Resumo/InfoResumo.ALIGN_CENTER = true


func seta_info(nome, res, desc):
	$Resumo/Nome.text = nome
	$Resumo/InfoResumo.text = res
	self.info = desc
	$Texto.text = info[pagina]

func mostra_texto():
	$Texto.text = info[pagina]

func _on_BotaoProx_pressed():
	pagina += 1
	if pagina > 0:
		$BotaoVoltar.visible = true
		$Voltar.visible = true
	if pagina == (info.size()-1):
		$BotaoProx.visible = false
		$Prox.visible = false
	$Texto.text = info[pagina]


func _on_BotaoVoltar_pressed():
	pagina -= 1
	if pagina < (info.size()-1):
		$BotaoProx.visible = true
		$Prox.visible = true
		if pagina < 1:
			$BotaoVoltar.visible = false
			$Voltar.visible = false
	$Texto.text = info[pagina]


func _on_Fechar_pressed():
	get_parent().podefazer = true
	self.queue_free()
	print('Caixa Fechada')
