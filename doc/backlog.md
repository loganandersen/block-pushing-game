# Intro
This is the product backlog, It has a list of things that could or
should be done. 

Anybody can add to the backlog if they have ideas. 

# Quick Links  
- [guidelines](guidelines.md)
- [readme](../README.md)

# Third Sprint (Due 10/29/2024)
## Aidan 
- Finish readme
- Read over the code and describe its archetecture. 
- ~~make door asset~~ 10/24/2024 

## Logan
- Test the game
  - Orthogonal movement
  - Stop at wall
  - You can push block
- Create requirements spreadsheet
- Make level tester
- Make some basic levels
- Read the WIP readme and then critique it (tell Aidan if it needs changed)
- Save the old sprint TODOS and put them in a different file [old
  sprints](old_sprints.md). 
- Make a timeline for the project. 

## James
- Make it so you can win levels
- Make it so player goes to another level after you win it
- Write document that tells people how to create levels. 

# First Sprint (Minimum we need to get done for this sprint)
## Aidan
- ~~Get pictures for blocks and add them to the assets folder~~ 10/14/2024

## James
(James says this is done 10/22/2024)  I will test this and cross these off. 
- Get player to move
  - Player should move orthogonally in all directions
  - Player should stop at wall 
## Logan 
- ~~Create Github repo~~ 10/11/2024
- ~~Create Backlog~~ 10/11/2024

# Second Sprint
## Aidan
- Write readme for github (He worked on it 10/14/2024, but It isn't done) 
- ~~Make levels~~ 10/14/2024

## James 
- ~~Get boxes to work~~ 10/22/2024
- ~~Player should stop at walls~~ 10/22/2024

## Logan 
- Make levels (Didn't do because of no code)
- Auto movement for testing (Didn't do because of no code)


# Critical features
## Game
### Movement 
- ~~The player should be able to move orthogonally in all directions.~~ 10/22/2024
- ~~Player should stop at walls~~ 10/22/2024
- ~~Player should be able to push boxes around~~ 10/22/2024

### Mechanics 
- Buttons, 
  - Button should be able to open door when box is pushed on it.
- Flag 
  - A flag that the player has to get to to beat the level. 
- 

### Level select

Here are some ideas for how level select should work.

#### Options for level select
- Level block, The level selection could be just like the regular
  game, but there would be a block that the player can walk into to
  select the level.
- 

# Agreed upon game features
- Wires to tell the player where buttons connect. 

# Documentation
## Readme
A readme for this repo should be created, and it should have...
- Name of game
- Our names
- A short description of the game
- Instructions on how to compile the game. 
- Statement of the licenses of the program.
- Link to backlog
- Written in Markdown (https://www.markdownguide.org/basic-syntax/)

## Licensing 
- MIT license for our own code
- No software license for any code we want to take from third party should be more restrictive than MIT.
- Game assets should be free culture as defined by the creative
  commons. 
- We should have a document that lists the licenses for each file.
- We should have a document that lists the acceptable licenses for
  code and game assets. 

## Credits
- A document that credits all the outside work we've used.
- Video game credits where we credit the godot engine, and the authors
  of any assets/code we've used.

## Guidelines
We should have a set of guidelines for developing the game. 
[guidelines](guidelines.md)

## Requirements document
A document describing all of the current game requirements we have
should be made.

- Requirements spreadsheet.

# Ideas
This is a list of ideas for the game. These should be added after we
get the critical features done with. 

## Ideas that have been disscussed 
### Swap block
When player walks into the block he swaps places with it. If the block
is on top of a button, then it activates the button.

If a box is pushed into the swap block, then it should swap places
with the block. Logically, the swap block should move towards the end
of the line of boxes, since each box wants to move. Assume a
configuration like this, where P is the player, # is a box, and S is
the swap block. 

	P#S 

If the player wants to move left then the box will be pushed onto the
swap block.

	PS# 

The player still wants to move left so he can now swap with the swap
block. 

	SP#
	
Therefore the swap block ends up at the very end of a line of boxes if
it's pushed.

An example of a puzzle using this block could look like this, where
the dots are walls, and the flag (to beat the game) is F if active,
and f if inactive. Each swap block is on top of a button, and all
buttons need to be active for the flag to win. 0 will be a button

	................
	.      S       .
	. P    S      F.
	.      S       .
	................
	
The solution is as follows...

	................
	.      S       .
	.     PS      F.
	.      S       .
	................
		
	................
	.      S       .
	.     SP      F.
	.      S       .
	................
	
	................
	.      SP      .
	.     S0      f.
	.      S       .
	................
	
	................
	.      PS      .
	.     S0      f.
	.      S       .
	................
	
	................
	.      0S      .
	.     SP      f.
	.      S       .
	................
	
	................
	.      0S      .
	.     PS      f.
	.      S       .
	................
	
	................
	.     P0S      .
	.      S      f.
	.      S       .
	................
	
	................
	.      SP      .
	.      S      F.
	.      S       .
	................
	
Then you would touch the flags
### Spikes
Boxes can go ontop of spikes, whereas player cannot. 

### Living block
Living block acts like a box, but it dies when you push it on top
of spikes. 

The reason why you'd want a block like this is because you could throw
it away when it's no longer useful by pushing it into spikes. 

## Other ideas

### 

### Pushable spikes 

A block that acts like spikes, if you push it then you die. You can
still push the block indirectly by pushing it with a normal block. 

You could also push it into a living block to kill it. 

### Autonimous blocks

Blocks that move on their own. Specifically they should move every
time the player moves, rather than moving in real time. 

This would complicate the game engine because you could have a
situation where two blocks want to move into the same spot. 

### Functional wires

If we make the wires functional, then we could make blocks that
interact with them. 

#### Wire block

A block that can connect wires. 

#### Energy block

A block that can power wires

#### Logic gates

Logic gate blocks 

Blocks that act like logic gates, If we implment these, then we'd
probably have to think of some way to to rotate them. 
