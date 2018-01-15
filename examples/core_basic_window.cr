require "cray"

# Initialization
#-------------------------------------------------------------------------------
screen_width = 800
screen_height = 450

LibRay.init_window(screen_width, screen_height, "raylib [core] example - basic window")
LibRay.set_target_fps(60)
#-------------------------------------------------------------------------------

# Main game loop
while !LibRay.window_should_close?
  # Update
  #-----------------------------------------------------------------------------
  # TODO: Update your variables here
  #-----------------------------------------------------------------------------

  # Draw
  #-----------------------------------------------------------------------------
  LibRay.begin_drawing
  LibRay.clear_background(LibRay::RAYWHITE)
  LibRay.draw_text("Congrats! You created your first window!", 190, 200, 20, LibRay::LIGHTGRAY)
  LibRay.end_drawing
  #-----------------------------------------------------------------------------
end

# De-Initialization
#-------------------------------------------------------------------------------
LibRay.close_window  # Close window and OpenGL context
#-------------------------------------------------------------------------------
