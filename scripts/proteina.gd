extends Node

var textura = preload("res://icon.png")
var id
var nome
var descri


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

func invisivel():
	$Textura.play('invisivel')

func visivel():
	$Textura.play('default')
	
func bomba_Na_Cl(quant):                                                        # Func de controle da animação da bomba
	if quant> 0:                                                                # quant recebe a quantidade de vezes que se deseja que a animação seja feita
		var i = 0                                                               # i controla a repetição do laço
		while(i<quant):                                                         # 
			$Textura.play('bombaNaCl')                                          # Troca a animação para a da bomba
			while($Textura.is_playing()):                                       # Espera a animação trocar dentro desse laço
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
