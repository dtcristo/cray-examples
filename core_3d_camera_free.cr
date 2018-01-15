require "cray"

# Initialization
#-------------------------------------------------------------------------------
screen_width = 800
screen_height = 450

LibRay.init_window(screen_width, screen_height, "raylib [core] example - 3d camera free")

# Define the camera to look into our 3d world
camera = LibRay::Camera.new
camera.position = LibRay::Vector3.new(x: 10.0, y: 10.0, z: 10.0)  # Camera position
camera.target = LibRay::Vector3.new(x: 0.0, y: 0.0, z: 0.0)       # Camera looking at point
camera.up = LibRay::Vector3.new(x: 0.0, y: 1.0, z: 0.0)           # Camera up vector (rotation towards target)
camera.fovy = 45.0                                                # Camera field-of-view Y

cube_position = LibRay::Vector3.new(x: 0.0, y: 0.0, z: 0.0)

LibRay.set_camera_mode(camera, LibRay::CameraMode::CAMERA_FREE)  # Set a free camera mode
LibRay.set_target_fps(60)  # Set our game to run at 60 frames-per-second
#-------------------------------------------------------------------------------

# Main game loop
while !LibRay.window_should_close?  # Detect window close button or ESC key
  # Update
  #-----------------------------------------------------------------------------
  LibRay.update_camera(pointerof(camera))  # Update camera

  if LibRay.key_down?(LibRay::KEY_Z)
    camera.target = LibRay::Vector3.new(x: 0.0, y: 0.0, z: 0.0)
  end
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
    
    LibRay.draw_rectangle(10, 10, 320, 133, LibRay.fade(LibRay::SKYBLUE, 0.5))
    LibRay.draw_rectangle_lines(10, 10, 320, 133, LibRay::BLUE)
    LibRay.draw_text("Free camera default controls:", 20, 20, 10, LibRay::BLACK)
    LibRay.draw_text("- Mouse Wheel to Zoom in-out", 40, 40, 10, LibRay::DARKGRAY)
    LibRay.draw_text("- Mouse Wheel Pressed to Pan", 40, 60, 10, LibRay::DARKGRAY)
    LibRay.draw_text("- Alt + Mouse Wheel Pressed to Rotate", 40, 80, 10, LibRay::DARKGRAY)
    LibRay.draw_text("- Alt + Ctrl + Mouse Wheel Pressed for Smooth Zoom", 40, 100, 10, LibRay::DARKGRAY)
    LibRay.draw_text("- Z to zoom to (0, 0, 0)", 40, 120, 10, LibRay::DARKGRAY)

  LibRay.end_drawing
  #-----------------------------------------------------------------------------
end

# De-Initialization
#-------------------------------------------------------------------------------
LibRay.close_window  # Close window and OpenGL context
#-------------------------------------------------------------------------------
