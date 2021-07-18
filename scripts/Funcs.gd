extends Node
# Script que armazena as funções celulares.

var celula = preload("res://scenes/Celula.tscn")
var vesicula = preload("res://scenes/Vesicula.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func div_celular(inicial):
	var pos_inici = inicial.get_position()                                      # Posição em que começou a se dividir
	var duplicata = celula.instance()                                           # Nova celula
	add_child(duplicata)                                                        # Adiciona ela ao mesmo pai da original
	duplicata.membr_invisivel()                                                 # Deixa a membrana da célula invisivel
	var i = 0
	for organela in inicial.get_children():
		if not organela.get('nome') == null:
			if not organela.nome in ['DNA', 'Membrana', 'Nucleo']:
				organela.visible = false
	inicial.anima_divisao()
	while i < 20:
		yield(get_tree().create_timer(0.1), "timeout")
		i+=1
	inicial.mudar_pos(pos_inici, -300, 0)
	duplicata.mudar_pos(pos_inici, 300, 0)
	inicial.voltar_textura()
	duplicata.voltar_textura()                                                  # Deixa a membrana visivel
	duplicata.estruturas = inicial.copiar_estruturas()
	duplicata.construir_estruturas()
	for organela in inicial.get_children():
		organela.visible = true

func bomba_na_cl(celula, quant):
	print('Na função de bomba do SCRIPT')
	for organela in celula.get_children():
		if not organela.get('nome') == null:
			if organela.nome == 'Proteína Transmembranar':
				print("É uma proteína")
				return organela.bomba_na_cl(quant)

func exocitose(celula):
	var temp = vesicula.instance()
	temp.scale = Vector2(0.6, 0.6)
	temp.position = celula.get_golgi_pos() - Vector2(200, 0)
	celula.add_child(temp)
	while temp.position.x < 430:
		temp.position += Vector2(10, 0)
		yield(get_tree().create_timer(0.1), "timeout")
	temp.play_liberar()

func endocitose(celula):
	var temp = vesicula.instance()
	temp.scale = Vector2(0.6, 0.6)
	temp.position = celula.get_golgi_pos() + Vector2(200, 0)
	celula.add_child(temp)
	temp.play_absorver()
