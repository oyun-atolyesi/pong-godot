extends StaticBody2D
class_name Cpu

@export var ball: Ball

var ball_pos: Vector2
var dist: int
var move_by: int
var win_height: int
var p_height: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.size.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ball_pos = ball.position
	dist = position.y - ball_pos.y
	
	var speed = get_parent().PADDLE_SPEED * delta
	if abs(dist) > speed:
		move_by = speed * (dist / abs(dist))
	else:
		move_by = dist
	var new_position = position.y - move_by
	position.y = clamp(new_position, p_height/2, win_height - p_height/2)
