extends Node2D

var celula = preload("res://scenes/Celula.tscn")
var funcs = preload("res://scenes/Funcs.tscn")
var temp
var f

# Called when the node enters the scene tree for the first time.
func _ready():
	temp = celula.instance()                                                # Testando a duplicata logo
	add_child(temp)
	temp.mudar_pos(Vector2(0,0), 700, 500)
	temp.add_estrutura(2)
	temp.add_estrutura(0)
	temp.add_estrutura(1)
	temp.add_estrutura(6)
	temp.add_estrutura(7)
	temp.add_estrutura(10)
	temp.add_estrutura(4)
	temp.add_estrutura(3)
	temp.add_estrutura(5)
	temp.add_estrutura(8)
	temp.add_estrutura(9)
	temp.construir_estruturas()
	f = funcs.instance()
	add_child(f)
	f.endocitose(temp)
	#f.bomba_na_cl(temp, 0)
	
	#divisao_celular(temp)

#func _process(delta):
	#temp.mudar_pos(temp.get_position(), 1, 0)

func divisao_celular(inicial):                                                  # Procedimento de divisão
	var pos_inici = inicial.get_position()                                      # Posição em que começou a se dividir
	var duplicata = celula.instance()                                           # Nova celula
	add_child(duplicata)                                                        # Adiciona ela ao mesmo pai da original
	duplicata.membr_invisivel()                                                 # Deixa a membrana da célula invisivel
	var i = 0
	for organela in inicial.get_children():
		if not organela.get('nome') == null:
			print(organela.nome)
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
