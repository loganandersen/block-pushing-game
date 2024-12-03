extends TileMapLayer

# These are the atlas coordinates of each tile. The atlas coordinates are used
# to refer to each tile in the tile map. 
const LEVEL1 = Vector2i(0,0)
const LEVEL2 = Vector2i(1,0)
const LEVEL3 = Vector2i(2,0)
const LEVEL4 = Vector2i(3,0)
const LEVEL5 = Vector2i(0,1)
const LEVEL6 = Vector2i(1,1)
const LEVEL7 = Vector2i(2,1)
const PLAYER_TILE = Vector2i(3,1)
const EMPTY = Vector2i(-1,-1)

#This is defined here because 
# I am mainly worried about scope, when using the _ready function
var playerLocation : Vector2i
var backgroundGrid : TileMapLayer 

# I will assume nothing in the background grid moves.
func get_background_grid():
	return get_node("../BackgroundGrid")


func find_player_location() :
	return get_used_cells_by_id(0,PLAYER_TILE)[0]
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerLocation = find_player_location()
	backgroundGrid = get_background_grid()

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		
		# Move the player
		if event.is_action_pressed("move_down"):
			var move_success = attempt_move(playerLocation, playerLocation + Vector2i(0,1))
			if(move_success):
				playerLocation = playerLocation + Vector2i(0,1)
			
		if event.is_action_pressed("move_up"):
			var move_success = attempt_move(playerLocation, playerLocation + Vector2i(0,-1))
			if(move_success):
				playerLocation = playerLocation + Vector2i(0,-1)
			
		if event.is_action_pressed("move_left"):
			var move_success = attempt_move(playerLocation, playerLocation + Vector2i(-1,0))
			if(move_success):
				playerLocation = playerLocation + Vector2i(-1,0)
			
		if event.is_action_pressed("move_right"):
			var move_success = attempt_move(playerLocation, playerLocation + Vector2i(1,0))
			if(move_success):
				playerLocation = playerLocation + Vector2i(1,0)
		
		# Update tiles that have been affected by certain game conditions
		

#Attempt to move whatever is at from_coords to to_coords
#Returns true if the move was successful, false if it was prevented
func attempt_move(from_coords, to_coords):
	
	#Stop on walls
	if(get_cell_atlas_coords(to_coords) != LEVEL1 || LEVEL2 || LEVEL3 || LEVEL4 || LEVEL5 || LEVEL6 || LEVEL7):
		return false
	
	#Actually move
	# Set the tile we are supposed to move to to the tile from the previous 
	# position
	set_cell(to_coords, 0, get_cell_atlas_coords(from_coords))
	#Set the tile where the player was last to empty
	set_cell(from_coords, 0, EMPTY)
	
	#Indicate the move was successful
	return true
