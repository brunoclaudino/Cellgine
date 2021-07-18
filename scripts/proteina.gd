extends Node
var textura_potassio = preload("res://assets/img/potassio.png")
var textura_sodio = preload("res://assets/img/sodio.png")
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
var devolver = true                                                             # Variável que define se vai ser feito a animação de devolução de Na+ e K


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

func devolve_nas(s1, s2, s3):
	var i = 0;
	while i < 198:
		if i < 48:
			s1.position -= Vector2(20, 0)
			s2.position -= Vector2(20, 0)
			s3.position -= Vector2(20, 0)
		elif i < 96:
			s1.position -= Vector2(0, 20)
			s2.position -= Vector2(0, 20)
			s3.position -= Vector2(0, 20)
		else:
			s1.position += Vector2(20, 0)
			s2.position += Vector2(20, 0)
			s3.position += Vector2(20, 0)
		yield(get_tree().create_timer(0.03),"timeout")
		i += 1
	s1.queue_free()
	s2.queue_free()
	s3.queue_free()


func _on_Textura_animation_finished():
	if tipo_anim[0] == "bombaNaCl":
		if typeof(tipo_anim[1]) == TYPE_STRING:
			#$Textura.play("bombaNaCl", false)
			pass
		elif typeof(tipo_anim[1]) == TYPE_INT:
			tipo_anim[1] += 1
			if tipo_anim[2] > tipo_anim[1]:
				#$Textura.play("bombaNaCl", false)
				pass
			else:
				$Textura.play("default", false)
		


func _on_Textura_frame_changed():
	if devolver:
		if $Textura.get_frame() == 3:
			var p1 = Sprite.new()
			p1.position = Vector2(400, 5.3)
			p1.rotation_degrees = -70
			p1.texture = textura_potassio
			add_child(p1)
			var p2 = Sprite.new()
			p2.position = Vector2(272.236, -14.142)
			p2.rotation_degrees = -60
			p2.texture = textura_potassio
			add_child(p2)
			devolve_ks(p1, p2)
		if $Textura.get_frame() == 14:
			var s1 = Sprite.new()
			s1.position = Vector2(-497.25, -173.242)
			s1.texture = textura_sodio
			add_child(s1)
			var s2 = Sprite.new()
			s2.position = Vector2(-419.526, -138.593)
			s2.texture = textura_sodio
			add_child(s2)
			var s3 = Sprite.new()
			s3.position = Vector2(-331.5, -105.81)
			s3.texture = textura_sodio
			add_child(s3)
			devolve_nas(s1, s2, s3)

