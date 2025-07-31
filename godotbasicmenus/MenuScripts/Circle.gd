extends Node2D

var start_radius: float
var end_radius: float
var duration: float
var color: Color
var radius: float = 0.0
var elapsed_time: float = 0.0

func setup(pos: Vector2, min_r: float, max_r: float, dur: float, col: Color) -> void:
	position = pos
	start_radius = min_r
	end_radius = max_r
	duration = dur
	color = col
	radius = min_r
	elapsed_time = 0.0
	set_process(true)

func _process(delta: float) -> void:
	elapsed_time += delta
	var t = elapsed_time / duration
	if t > 1.0:
		queue_free()
		return

	radius = lerp(start_radius, end_radius, t)
	queue_redraw()

func _draw() -> void:
	var center = Vector2.ZERO
	var thickness = 2.0
	var segments = 64
	draw_arc(center, radius, 0, TAU, segments, color, thickness)
