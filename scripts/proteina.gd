extends Node

var id
var nome = 'Proteína Transmembranar'
var resumo = 'Transporte de substâncias'
var descricao = ['Proteínas Trabsmembranares atravessam toda a membrana plasmática.',
'Principal função é o transporte de substâncias de forma ativa.',
'Através delas acontece a Bomba de sódio-potássio.',
'Pelas proteínas também podem passar moléculas maiores e elétrons']
# Variáveis para fazer a caixa de descrição das organelas aparecer
var caixa_descricao
var podefazer = true
var tipo_anim
var potassio_texture = preload("res://assets/img/potassio.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	bomba_na_cl(2)

func invisivel():
	$Textura.play('invisivel')

func visivel():
	$Textura.play('default')
	
func bomba_na_cl(quant):                                                        # Func de controle da animação da bomba
	print('Chegou no script da ORGANELA')
	if quant> 0:                                                                # quant recebe a quantidade de vezes que se deseja que a animação seja feita
		tipo_anim = ["bombaNaCl", 0, quant]
		$Textura.play("bombaNaCl", false)
	elif quant == 0:                                                            # Se quant for = 0, a animação ocorre pra sempre
		tipo_anim = ["bombaNaCl", "infinito", 0]
		$Textura.play("bombaNaCl", false)
	else:                                                                       # Se o valor for < 0, erro!
		print('Valor inserido é Inválido')
		return 'error'
	return 'success'

func devolve_ks(p1, p2):
	var i = 0
	while i < 216:
		if i < 48:
			p1.position += Vector2(20, 0)
			p2.position += Vector2(20, 0)
		elif i < 96:
			p1.position += Vector2(0, 20)
			p2.position += Vector2(0, 20)
		else:
			p1.position -= Vector2(20, 0)
			p2.position -= Vector2(20, 0)
		yield(get_tree().create_timer(0.03), "timeout")
		i += 1
	p1.queue_free()
	p2.queue_free()


func _on_Textura_animation_finished():
	if tipo_anim[0] == "bombaNaCl":
		if typeof(tipo_anim[1]) == TYPE_STRING:
			$Textura.play("bombaNaCl", false)
		elif typeof(tipo_anim[1]) == TYPE_INT:
			tipo_anim[1] += 1
			if tipo_anim[2] > tipo_anim[1]:
				$Textura.play("bombaNaCl", false)
			else:
				$Textura.play("default", false)
		


func _on_Textura_frame_changed():
	if $Textura.get_frame() == 3:
		var p1 = Sprite.new()
		p1.position = Vector2(400, 5.3)
		p1.rotation_degrees = -70
		p1.texture = potassio_texture
		add_child(p1)
		var p2 = Sprite.new()
		p2.position = Vector2(272.236, -14.142)
		p2.rotation_degrees = -60
		p2.texture = potassio_texture
		add_child(p2)
		devolve_ks(p1, p2)
