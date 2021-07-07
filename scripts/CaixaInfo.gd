extends Polygon2D

var info = []
var pagina = 0
var mouse_entrou = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$BotaoVoltar.visible = false
	$Voltar.visible = false


func seta_info(desc):
	self.info = desc

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
	mostra_texto()


func _on_BotaoVoltar_pressed():
	pagina -= 1
	if pagina < (info.size()-1):
		$BotaoProx.visible = true
		$Prox.visible = true
		if pagina < 1:
			$BotaoVoltar.visible = false
			$Voltar.visible = false
	mostra_texto()


func _on_Fechar_pressed():
	get_parent().podefazer = true
	self.queue_free()
	print('Caixa Fechada')
