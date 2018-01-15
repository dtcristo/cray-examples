require "cray"

# Initialization
#-------------------------------------------------------------------------------
screen_width = 800
screen_height = 450

LibRay.init_window(screen_width, screen_height, "raylib [core] example - 3d mode")

# Define the camera to look into our 3d world
camera = LibRay::Camera.new
camera.position = LibRay::Vector3.new(x: 0.0, y: 10.0, z: 10.0)  # Camera position
camera.target = LibRay::Vector3.new(x: 0.0, y: 0.0, z: 0.0)      # Camera looking at point
camera.up = LibRay::Vector3.new(x: 0.0, y: 1.0, z: 0.0)          # Camera up vector (rotation towards target)
camera.fovy = 45.0                                               # Camera field-of-view Y

cube_position = LibRay::Vector3.new(x: 0.0, y: 0.0, z: 0.0)

LibRay.set_target_fps(60)  # Set our game to run at 60 frames-per-second
#-------------------------------------------------------------------------------

# Main game loop
while !LibRay.window_should_close?  # Detect window close button or ESC key
  # Update
  #-----------------------------------------------------------------------------
  # TODO: Update your variables here
  #-----------------------------------------------------------------------------

  # Draw
  #-----------------------------------------------------------------------------
  LibRay.begin_drawing

    LibRay.clear_background(LibRay::RAYWHITE)
    LibRay.begin_3d_mode(camera)

      LibRay.draw_cube(cube_position, 2.0, 2.0, 2.0, LibRay::RED)
      LibRay.draw_cube_wires(cube_position, 2.0, 2.0, 2.0, LibRay::MAROON)
      LibRay.draw_grid(10, 1.0)

    LibRay.end_3d_mode
    LibRay.draw_text("Welcome to the third dimension!", 10, 40, 20, LibRay::DARKGRAY)
    LibRay.draw_fps(10, 10)

  LibRay.end_drawing
  #-----------------------------------------------------------------------------
end

# De-Initialization
#-------------------------------------------------------------------------------
LibRay.close_window  # Close window and OpenGL context
#-------------------------------------------------------------------------------
