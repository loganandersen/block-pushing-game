extends TileMapLayer

# These are the atlas coordinates of each tile. The atlas coordinates are used
# to refer to each tile in the tile map. 
const PLAYER_TILE = Vector2i(1,0)
const WALL_TILE = Vector2i(3,1)
const BOX_TILE = Vector2i(0,1)
const BUTTON = Vector2i(2,0)
const GOAL = Vector2(3,0)
const GOAL_CLOSED = Vector2(2,1)
const EMPTY = Vector2i(-1,-1)

# Various variables used in the code, all are initialized by _ready()
var playerLocation : Vector2i
var buttonLocations : Array[Vector2i]
var goalLocation : Vector2i 
var backgroundGrid : TileMapLayer 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerLocation = find_player_location()
	backgroundGrid = get_background_grid()
	# initialize goal
	goalLocation = find_goal()
	# Initialize buttons
	buttonLocations = backgroundGrid.get_used_cells_by_id(0,BUTTON)
	

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
		
		if event.is_action_pressed("restart"):
			# Get the top scene and reload
			get_tree().reload_current_scene()
			
		# Update tiles that have been affected by certain game conditions
		update_goal()
		if check_level_win() :
			get_tree().change_scene_to_file("res://hub_world.tscn")


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
	# Set the tile we are supposed to move to to the tile from the previous 
	# position
	set_cell(to_coords, 0, get_cell_atlas_coords(from_coords))
	#Set the tile where the player was last to empty
	set_cell(from_coords, 0, EMPTY)
	
	#Indicate the move was successful
	return true

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
		

# Checks if the player is on top of the goal, and if the goal is active.
func check_level_win() :
	return all_buttons_pushed() and playerLocation == goalLocation

#Check if there is a tile over every button
func all_buttons_pushed() : 
	# Check if any block above the button is empty
	for position in buttonLocations :
		if get_cell_atlas_coords(position) == EMPTY:
			return false
	return true
		

# Make the goal green if all buttons are pushed, make it black if no buttons
# pushed.
func update_goal() : 
	if all_buttons_pushed() : 
		backgroundGrid.set_cell(goalLocation, 0, GOAL)
	else :
		backgroundGrid.set_cell(goalLocation, 0, GOAL_CLOSED)

func find_player_location() :
	return get_used_cells_by_id(0,PLAYER_TILE)[0]
	
