extends Node2D

var celula = preload("res://scenes/Celula.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var temp = celula.instance()                                                # Testando a duplicata logo
	add_child(temp)
	temp.mudar_pos(Vector2(0,0), 500, 300)
	temp.add_estrutura(4)
	temp.construir_estruturas()
	divisao_celular(temp)


func divisao_celular(inicial):                                                  # Procedimento de divisão
	var pos_inici = inicial.get_position()                                      # Posição em que começou a se dividir
	var duplicata = celula.instance()                                           # Nova celula
	add_child(duplicata)                                                        # Adiciona ela ao mesmo pai da original
	duplicata.membr_invisivel()                                                 # Deixa a membrana da célula invisivel
	var i = 0
	inicial.anima_divisao()
	while i < 20:
		yield(get_tree().create_timer(0.1), "timeout")
		i+=1
	inicial.mudar_pos(pos_inici, -113, 0)
	duplicata.mudar_pos(pos_inici, 113, 0)
	inicial.voltar_textura()
	duplicata.voltar_textura()                                                  # Deixa a membrana visivel
	duplicata.estruturas = inicial.copiar_estruturas()
	duplicata.construir_estruturas()
