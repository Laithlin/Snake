extends Node2D

func _draw():
	for n in range(16):
		draw_line(Vector2(32*n, 0), Vector2(32*n, 512), Color.GREEN, 1.0)
		draw_line(Vector2(0, 32*n), Vector2(512, 32*n), Color.GREEN, 1.0)

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func new_game():
	$Player.start($StartPosition.position)
