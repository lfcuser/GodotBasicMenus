extends Control

@export var min_radius: float = 10.0
@export var max_radius_factor: float = 2
@export var spawn_interval: float = 1
@export var animation_duration: float = 100
@export var circle_color: Color = Color(1, 1, 1, 0.1)
@export var circle_scene: PackedScene = preload("res://MenuScenes/Circle.tscn")

var prev_pos = null

func _ready() -> void:
	randomize()
	spawn_circle_loop()

func spawn_circle_loop() -> void:
	while true:
		await get_tree().create_timer(spawn_interval).timeout
		spawn_circle()

func spawn_circle() -> void:
	var circle = circle_scene.instantiate()
	var screen_size = get_viewport_rect().size
	var max_radius = screen_size.x * max_radius_factor
	var pos = prev_pos
	
	if (pos == null):
		pos = Vector2(
			randf_range(0, screen_size.x),
			randf_range(0, screen_size.y)
		)
		prev_pos = pos
	else:
		pos.x = abs(pos.x - screen_size.x)
		pos.y = abs(pos.y - screen_size.y)
		prev_pos = null
	circle.setup(pos, min_radius, max_radius, animation_duration, circle_color)
	add_child(circle)
