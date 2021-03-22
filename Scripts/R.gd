#	La classe: R 	(-> pour Ressources)
#	est la classe permettant d'acceder aux ressources du jeu:
#	- getString(clef) -> d'acceder aux textes contenus dans 'Strings.js'
#										> > > ATTENTION ! < < <
#								le contenu de 'Strings.js' doit être de la forme:
#									{
#										uneClef: 'la valeur de cette clef.' ,
#										uneAutreClef: 'Une autre valeur attachée !'
#									}
extends Node


var _strings: Dictionary = { }
const PATH_TO_STRINGS: String= "res://Assets/Values/Strings.js"

var _cartes: Dictionary = { }
const PATH_TO_CARDS: String= "res://Assets/Sprites/Cartes/"



func _ready():
	_loadStrings()
	_loadCartes()



# ============================
#	R.strings
func _loadStrings():
	""" Charge tout les txt contenu dans le fichier contenant les ressources de txt"""
	var file = File.new()
	file.open(PATH_TO_STRINGS, File.READ)
	var nvStrings: Dictionary = parse_json(file.get_as_text())
	assert( typeof(nvStrings) == TYPE_DICTIONARY, "err - _loadStrings()")
	_strings = nvStrings.duplicate()
	file.close()


func getString(key: String)-> String:
	""" retourne le text de la clef contenus dans le fichier de ressources txt."""
	if not key in _strings:
		push_warning("Cette clef n'est pas dans les ressources de txt.")
		return ""
	return str(_strings.get(key))


# ============================
#	R.cartes

func _loadCartes():
	var reg:RegEx = RegEx.new()
	reg.compile('.jpeg$')
	
	var dir = Directory.new()
	assert(dir.open(PATH_TO_CARDS) == OK , "err - _loadCartes()")
	
	dir.list_dir_begin()
	var file = dir.get_next()
	while file != "":
		if not  dir.current_is_dir():
			if reg.search(file):
				var streamTexture = load(PATH_TO_CARDS + file)
				var image = streamTexture.get_data()
				var imageTexture = ImageTexture.new()
				imageTexture.create_from_image(image)
				_cartes[file] = imageTexture
		
		file = dir.get_next()
	


func getCarte(key: String):
	pass
