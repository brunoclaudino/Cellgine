extends Node2D


# Declare member variables here. Examples:


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func play_liberar():
	$Textura.play("liberar", false)

func play_absorver():
	$p1.position += Vector2(0, 80)
	$p2.position += Vector2(0, 80)
	$p3.position += Vector2(0, 80)
	$p4.position += Vector2(0, 80)
	$Textura.play("absorver", false)


func _on_AnimatedSprite_frame_changed():
	if $Textura.animation == 'liberar':
		match $Textura.get_frame():
			1:
				$p1.position += Vector2(0, 20)
				$p2.position += Vector2(0, 20)
				$p3.position += Vector2(0, 20)
				$p4.position += Vector2(0, 20)
			2:
				$p1.position += Vector2(6, 10)
				$p2.position += Vector2(-6, 10)
				$p3.position += Vector2(6, 10)
				$p4.position += Vector2(-6, 10)
			5:
				$p1.position += Vector2(0, 20)
				$p2.position += Vector2(0, 20)
				$p3.position += Vector2(0, 20)
				$p4.position += Vector2(0, 20)
			9:
				$p1.position += Vector2(0, 20)
				$p2.position += Vector2(0, 20)
				$p3.position += Vector2(0, 20)
				$p4.position += Vector2(0, 20)
			11:
				$p1.position += Vector2(0, 20)
				$p2.position += Vector2(0, 20)
				$p3.position += Vector2(0, 20)
				$p4.position += Vector2(0, 20)
			12:
				$p1.position += Vector2(0, 20)
				$p2.position += Vector2(0, 20)
				$p3.position += Vector2(0, 20)
				$p4.position += Vector2(0, 20)
			13:
				$p1.position += Vector2(0, 20)
				$p2.position += Vector2(0, 20)
				$p3.position += Vector2(0, 20)
				$p4.position += Vector2(0, 20)
			14:
				$p1.position += Vector2(0, 20)
				$p2.position += Vector2(0, 20)
				$p3.position += Vector2(0, 20)
				$p4.position += Vector2(0, 20)
			16:
				$p1.position += Vector2(0, 20)
				$p2.position += Vector2(0, 20)
				$p3.position += Vector2(0, 20)
				$p4.position += Vector2(0, 20)
			17:
				$Textura.play('invisivel', false)
				$p1.position += Vector2(0, 10)
				$p2.position += Vector2(0, 10)
				$p3.position += Vector2(0, 10)
				$p4.position += Vector2(0, 10)
				yield(get_tree().create_timer(1), "timeout")
	if $Textura.animation == 'absorver':
		match $Textura.get_frame():
			12:
				$p1.position -= Vector2(0, 20)
				$p2.position -= Vector2(0, 20)
				$p3.position -= Vector2(0, 20)
				$p4.position -= Vector2(0, 20)
			13:
				$p1.position -= Vector2(0, 20)
				$p2.position -= Vector2(0, 20)
				$p3.position -= Vector2(0, 20)
				$p4.position -= Vector2(0, 20)
			15:
				$p1.position -= Vector2(0, 20)
				$p2.position -= Vector2(0, 20)
				$p3.position -= Vector2(0, 20)
				$p4.position -= Vector2(0, 20)
			16:
				$p1.position -= Vector2(0, 10)
				$p2.position -= Vector2(0, 10)
				$p3.position -= Vector2(0, 10)
				$p4.position -= Vector2(0, 10)


func _on_Textura_animation_finished():
	if $Textura.animation == 'absorver':
		var i = 0
		while i < 50:
			self.position -= Vector2(10, 0)
			yield(get_tree().create_timer(0.1), "timeout")
			i += 1
		yield(get_tree().create_timer(1), "timeout")
	queue_free()
