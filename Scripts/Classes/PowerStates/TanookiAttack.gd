extends Area2D

@onready var player : Player = owner

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func on_area_entered(area: Area2D) -> void:
	if area.owner is Enemy:
		area.owner.die()


func on_body_entered(body: Node2D) -> void:
	if body is BrickBlock:
		body.on_block_hit(player)
	elif body is Block:
		if body.get("item") != null:
			body.dispense_item()
		else:
			body.spawn_empty_block()
