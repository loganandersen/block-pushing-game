### Welcome to the block pushing game read me

In here you can find the Assets and Code used in the game.

The controlls for the game are as follows:
arrow keys to move, 'R' to restart a level, 'Enter' to enter a level while on the level select screen, 'Escape' will take you back to the level select from inside a level and back to the menu screen from the level select.

Here's the way we reccomend for downloading the game.

    Find the releases tab in the github
    Download the .exe and the .pck files
    Open the .exe in the same folder and the game should open

    If you want to edit the code, download the source code file
    open Godot's 4.3 executable and then open the project.godot file

You can find all the assets for the game in the asset folder, if you wish to change them, feel free. Just make sure to match the file type that we ues (.png).

#### Code

The file 'game_grid.gd' is where the logic happens for the levels, a quick overview for it is as follows:
Player moves,
first, can the player move here?
If yes, move there, if no, don't.
Next, forground and background
Any asset the player can stand on goes into the background,
any asset the player can NOT stand on goes in the foreground.

Same applies for the 'level_grid.gd':
Player moves,
first, can the player move here?
If yes, move there, if no, don't.
The player can only move onto level spaces in the level select


#### Credits

Aidan M, James S, Logan A

Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).
Copyright (c) 2007-2014 Juan Linietsky, Ariel Manzur.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
