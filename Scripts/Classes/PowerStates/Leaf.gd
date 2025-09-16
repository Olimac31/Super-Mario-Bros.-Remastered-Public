extends PowerUpState

var fly_time = 0
var fly_time_max = 0.3

var attack_time = 0
var attack_time_max = 0.2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.power_state.state_name == "Leaf" and player.state_machine.state.name == "Normal":
		
		# Slow Fall
		if Global.player_action_just_pressed("jump", player.player_id) and player.velocity.y > 0:
			fly_time = fly_time_max;
			AudioManager.play_sfx("swing_tail", player.global_position)
		
		if fly_time > 0:
			fly_time -= delta
			
			player.velocity.y = 3;
			
		# Tail Attack
		if Global.player_action_just_pressed("action", player.player_id):
			attack_time = attack_time_max;
			AudioManager.play_sfx("swing_tail", player.global_position)
		
		if attack_time > 0:
			attack_time -= delta;
			%TanookiAttack.get_node("CollisionShape2D").disabled = false
		else:
			%TanookiAttack.get_node("CollisionShape2D").disabled = true
	else:
		%TanookiAttack.get_node("CollisionShape2D").disabled = true

	if player.velocity_direction != 0:
		%TanookiAttack.scale.x = player.velocity_direction
