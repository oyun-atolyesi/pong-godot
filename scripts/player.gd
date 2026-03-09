extends StaticBody2D
class_name Player

var win_height: int
var p_height: int

func _ready() -> void:
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.size.y

func _process(delta: float) -> void:
	var dir = Input.get_axis("move_up", "move_down")
	
	if dir == 0:
		return
		
	var new_position = position.y + (dir * get_parent().PADDLE_SPEED * delta)
	position.y = clamp(new_position, p_height/2, win_height - p_height/2)
