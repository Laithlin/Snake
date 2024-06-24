extends Area2D
signal hit

@export var speed = 1
var screen_size
var curr = [0,0]
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	if Input.is_action_pressed("move_right"):
		curr = [1,0]
		$snake.animation = "right"
	elif Input.is_action_pressed("move_left"):
		curr = [-1,0]
		$snake.animation = "left"
	elif Input.is_action_pressed("move_up"):
		curr = [0,-1]
		$snake.animation = "up"
	elif Input.is_action_pressed("move_down"):
		curr = [0,1]
		$snake.animation = "down"
	
	$snake.play()
	position += Vector2(curr[0], curr[1])
	position = position.clamp(Vector2.ZERO, screen_size)

func _on_body_entered(body):
	$snake.stop()
	hit.emit()
	
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
