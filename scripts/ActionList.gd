extends Node

var lista = []


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_lista(id, tipo, tempo):
	#var temp = acao.new()
	#temp.define_vars(id, tipo, tempo)
	lista.append([id, tipo, tempo])
	lista.sort_custom(ordenador_curtom, "ordenar_cresc")
	print(lista)
	
class ordenador_curtom:
	static func ordenar_cresc(a, b):
		if a[2] < b[2]:
			return true
		return false

class acao:
	var celula_id
	var tipo_acao
	var tempo_inicio

	func define_vars(id, tipo, tempo):
		self.celula_id = id
		self.tipo_acao = tipo
		self.tempo_inicio = tempo

	func pega_id():
		return self.celula_id

	func pega_acao():
		return self.tipo_acao

	func pega_tempo():
		return self.tempo_inicio
