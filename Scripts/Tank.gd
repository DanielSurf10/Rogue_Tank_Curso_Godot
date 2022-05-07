extends KinematicBody2D


var speed      = 100
var pre_bullet = preload("res://Scenes/Bullet.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var dir_X = 0
	var dir_Y = 0
	
	
	if Input.is_action_pressed("ui_right"):
		dir_X += 1
	if Input.is_action_pressed("ui_left"):
		dir_X -= 1

	if Input.is_action_pressed("ui_up"):
		dir_Y -= 1
	if Input.is_action_pressed("ui_down"):
		dir_Y += 1
	
	
	if Input.is_action_just_pressed("ui_shoot") && get_tree().get_nodes_in_group("Cannon_Bullets").size() < 5:
		var bullet = pre_bullet.instance()										# Intancia a bala
		bullet.global_position = $Barrel/Muzzle.global_position				# Atribui uma posição
		$"../".add_child(bullet)												# Adiciona à cena 


	translate(Vector2(dir_X, dir_Y) * delta * speed)
