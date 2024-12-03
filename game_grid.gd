extends TileMapLayer

# These are the atlas coordinates of each tile. The atlas coordinates are used
# to refer to each tile in the tile map. 
const PLAYER_TILE = Vector2i(1,0)
const WALL_TILE = Vector2i(3,1)
const BOX_TILE = Vector2i(0,1)
const BUTTON = Vector2i(2,0)
const GOAL = Vector2(3,0)
const GOAL_CLOSED = Vector2(2,1)

#This is defined here because 
# I am mainly worried about scope, when using the _ready function
var playerLocation : Vector2i
var buttonLocations : Array[Vector2i]
var goalLocation : Vector2i 
var backgroundGrid : TileMapLayer 

# I will assume nothing in the background grid moves.
func get_background_grid():
	return get_node("../BackgroundGrid")

func find_goal(): 
	#Search for goals that are active
	var goals = backgroundGrid.get_used_cells_by_id(0,GOAL)
	# If there are no active goals search for an inactive one
	if goals.is_empty():
		goals = backgroundGrid.get_used_cells_by_id(0,GOAL_CLOSED)
	# Get the goal, this will crash if the level has no goal.  
	return goals[0]
		

func find_player_location() :
	return get_used_cells_by_id(0,PLAYER_TILE)[0]
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerLocation = find_player_location()
	backgroundGrid = get_background_grid()
	goalLocation = find_goal()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		
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

#Attempt to move whatever is at from_coords to to_coords
#Returns true if the move was successful, false if it was prevented
func attempt_move(from_coords, to_coords):
	
	#Stop on walls
	if(get_cell_atlas_coords(to_coords) == WALL_TILE):
		return false
	
	#Attempt to push boxes
	if(get_cell_atlas_coords(to_coords) == BOX_TILE):
		var was_pushed = attempt_move(to_coords, (2 * to_coords - from_coords))
		if(!was_pushed): #Check if the box ran into something
			return false
	
	#Actually move
	set_cell(to_coords, 0, get_cell_atlas_coords(from_coords))
	set_cell(from_coords, 0, Vector2i(20,4))
	
	#Indicate the move was successful
	return true
