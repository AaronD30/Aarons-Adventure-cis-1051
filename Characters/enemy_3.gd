extends CharacterBody2D
var speed_limiter = 3
var hero_position
var target_position
@onready var hero = get_parent().get_node("Hero")

func _physics_process(delta):
	hero_position = hero.position
	target_position = (hero_position - position)
	# The above portion of the code is based on "Godot 3.5 - Follow Player (Direct)" by ACTUALLYKRON found in https://pastebin.com/VqeXinZM
	velocity = target_position / speed_limiter
	move_and_slide()
	
	
func _on_area_2d_body_entered(body: Node) -> void:
	get_tree().reload_current_scene()
