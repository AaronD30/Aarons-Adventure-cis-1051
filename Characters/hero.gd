extends CharacterBody2D

@onready var animationTree = $AnimationTree
@onready var state_machine = animationTree.get("parameters/playback")


func _physics_process(delta):
	var inputDirection = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	update_animation_parameters(inputDirection)
	velocity = inputDirection * 100
	if(velocity != Vector2.ZERO):
		state_machine.travel("walk")
	else:
		state_machine.travel("stand")
	move_and_slide()
	

func update_animation_parameters(move_input : Vector2):
	if(move_input != Vector2.ZERO):
		animationTree.set("parameters/walk/blend_position", move_input)
# Used the code found in tutorial "Godot 4 Crash Course for Beginners - GameDev 2D Top Down Tutorial" by Chris' Tutorial https://www.youtube.com/watch?v=Luf2Kr5s3BM as a reference to make my character walk
		
		
