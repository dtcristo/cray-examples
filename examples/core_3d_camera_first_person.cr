require "cray"

MAX_COLUMNS = 20

# Initialization
#-------------------------------------------------------------------------------
screen_width = 800
screen_height = 450

LibRay.init_window(screen_width, screen_height, "raylib [core] example - 3d camera first person")

# Define the camera to look into our 3d world
camera = LibRay::Camera.new
camera.position = LibRay::Vector3.new(x: 4.0, y: 2.0, z: 4.0)  # Camera position
camera.target = LibRay::Vector3.new(x: 0.0, y: 1.8, z: 0.0)    # Camera looking at point
camera.up = LibRay::Vector3.new(x: 0.0, y: 1.0, z: 0.0)        # Camera up vector (rotation towards target)
camera.fovy = 60.0

columns = [] of NamedTuple(height: Int32, position: LibRay::Vector3, color: LibRay::Color)

MAX_COLUMNS.times do |i|
  height = LibRay.get_random_value(1, 12)
  position = LibRay::Vector3.new(
    x: LibRay.get_random_value(-15, 15),
    y: height/2,
    z: LibRay.get_random_value(-15, 15)
  )
  color = LibRay::Color.new(
    r: LibRay.get_random_value(20, 255),
    g: LibRay.get_random_value(10, 55),
    b: 30,
    a: 255
  )
  columns << {height: height, position: position, color: color}
end

LibRay.set_camera_mode(camera, LibRay::CameraMode::CAMERA_FIRST_PERSON)  # Set a first person camera mode
LibRay.set_target_fps(60)  # Set our game to run at 60 frames-per-second
#-------------------------------------------------------------------------------

# Main game loop
while !LibRay.window_should_close?  # Detect window close button or ESC key
  # Update
  #-----------------------------------------------------------------------------
  LibRay.update_camera(pointerof(camera))  # Update camera
  #-----------------------------------------------------------------------------

  # Draw
  #-----------------------------------------------------------------------------
  LibRay.begin_drawing

    LibRay.clear_background(LibRay::RAYWHITE)
    LibRay.begin_3d_mode(camera)

      LibRay.draw_plane(
        LibRay::Vector3.new(x: 0.0, y: 0.0, z: 0.0),
        LibRay::Vector2.new(x: 32.0, y: 32.0),
        LibRay::LIGHTGRAY
      )
      LibRay.draw_cube(
        LibRay::Vector3.new(x: -16.0, y: 2.5, z: 0.0),
        1.0,
        5.0,
        32.0,
        LibRay::BLUE
      )
      LibRay.draw_cube(
        LibRay::Vector3.new(x: 16.0, y: 2.5, z: 0.0),
        1.0,
        5.0,
        32.0,
        LibRay::LIME
      )
      LibRay.draw_cube(
        LibRay::Vector3.new(x: 0.0, y: 2.5, z: 16.0),
        32.0,
        5.0,
        1.0,
        LibRay::GOLD
      )

      columns.each do |column|
        LibRay.draw_cube(column[:position], 2.0, column[:height], 2.0, column[:color])
        LibRay.draw_cube_wires(column[:position], 2.0, column[:height], 2.0, LibRay::MAROON)
      end

    LibRay.end_3d_mode

    LibRay.draw_rectangle(10, 10, 220, 70, LibRay.fade(LibRay::SKYBLUE, 0.5))
    LibRay.draw_rectangle_lines(10, 10, 220, 70, LibRay::BLUE)
    LibRay.draw_text("First person camera default controls:", 20, 20, 10, LibRay::BLACK)
    LibRay.draw_text("- Move with keys: W, A, S, D", 40, 40, 10, LibRay::DARKGRAY)
    LibRay.draw_text("- Mouse move to look around", 40, 60, 10, LibRay::DARKGRAY)

  LibRay.end_drawing
  #-----------------------------------------------------------------------------
end

# De-Initialization
#-------------------------------------------------------------------------------
LibRay.close_window  # Close window and OpenGL context
#-------------------------------------------------------------------------------
