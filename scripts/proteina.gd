extends Node

var id
var nome = 'Proteína Transmembranar'
var resumo = 'Transporte de substâncias'
var descricao = ['Proteínas Trabsmembranares atravessam toda a membrana plasmática.',
'Principal função é o transporte de substâncias de forma ativa.',
'Através delas acontece a Bomba de sódio-potássio.',
'Pelas proteínas também podem passar moléculas maiores e elétrons']
# Variáveis para fazer a caixa de descrição das organelas aparecer
var mouse_entrou = false
var caixa_descricao
var podefazer = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

func invisivel():
	$Textura.play('invisivel')

func visivel():
	$Textura.play('default')
	
func bomba_na_cl(quant):                                                        # Func de controle da animação da bomba
	print('Chegou no script da ORGANELA')
	if quant> 0:                                                                # quant recebe a quantidade de vezes que se deseja que a animação seja feita
		var i = 0                                                               # i controla a repetição do laço
		while(i<quant):                                                         # 
			$Textura.play('bombaNaCl')                                          # Troca a animação para a da bomba
			while($Textura.is_playing()):                                       # Espera a animação trocar dentro desse laço
				#if $Textura.get_frame() == 3:
					#var p1 = Sprite.new()
					#p1.position = Vector2(400, 5.3)
					#p1.rotation_degrees = -70
					#var p2 = Sprite.new()
					#p2.position = Vector2(272.236, -14.142)
					#p2.rotation_degrees = -60
					#devolve_ks(p1, p2)
					pass
			i += 1
	elif quant == 0:                                                            # Se quant for = 0, a animação ocorre pra sempre
		while true:
			$Textura.play('bombaNaCl')
			while($Textura.is_playing()):
				pass
	else:                                                                       # Se o valor for < 0, erro!
		print('Valor inserido é Inválido')
		return 'error'
	$Textura.play('default')
	return 'success'

func devolve_ks(p1, p2):
	var i = 0
	while i < 192:
		if i < 48:
			p1.position += Vector2(10, 0)
			p2.position += Vector2(10, 0)
		elif i < 96:
			p1.position += Vector2(0, 10)
			p2.position += Vector2(0, 10)
		else:
			p1.position -= Vector2(10, 0)
			p2.position -= Vector2(10, 0)
		yield(get_tree().create_timer(0.1), "timeout")
		i += 1
	p1.queue_free()
	p2.queue_free()
