extends Node2D
class_name Game

@export var ball: Ball
@export var player: Player
@export var cpu: Cpu
@export var timer: Timer
@export var player_score_label: Label
@export var cpu_score_label: Label

var score := [0, 0]
const PADDLE_SPEED: int = 500


func _on_ball_timer_timeout() -> void:
	ball.new_ball()


func _on_score_left_body_entered(body: Node2D) -> void:
	print("score left")
	score[1] += 1
	cpu_score_label.text = str(score[1])
	timer.start()


func _on_score_right_body_entered(body: Node2D) -> void:
	print("score right")
	score[0] += 1
	player_score_label.text = str(score[0])
	timer.start()
