extends Control

var id
var pseudo
var points

func _ready():
	pseudo = "N/A"
	points = 0
#	var color_circle = load("res://Assets/Sprites/white_circle.png").duplicate()
#	$VBoxContainer/HBoxContainer/ColorCircle.set_texture(load("res://Assets/Sprites/white_circle.png"))
#	$VBoxContainer/HBoxContainer/ColorCircle.rect_size = Vector2(60,60)

func _process(delta):
	var pseudo = Network.utilisateurs[id].nom
	var couleur = Network.utilisateurs[id].couleur
	points = Network.utilisateurs[id].points
	$VBoxContainer/HBoxContainer/ColorCircle.modulate = couleur
	$VBoxContainer/HBoxContainer/Label.text = pseudo
	if(id == 1 and !Network.withHost):
		$VBoxContainer/HBoxContainer/TextureRect.texture = load("res://Assets/Sprites/crown.png")
	$VBoxContainer/HBoxContainer/Label2.text = str(points)

