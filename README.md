# cray-examples

Some examples from the [raylib](https://github.com/raysan5/raylib) game library ported to Crystal with the use of the [cray](https://gitlab.com/Zatherz/cray) raylib wrapper.

## Dependencies

### raylib
You must first install the shared library for raylib.

On macOS you can use Homebrew:
```
$ brew install raylib
```

On Arch Linux you can install `raylib` from the AUR.

Or [compile from source](https://github.com/raysan5/raylib/wiki/Compile-for-GNU-Linux) for Linux and be sure to use the `SHARED_RAYLIB=YES` compiler flag.

### cray
You can install cray using shards:
```
$ crystal deps
```

## Usage

Simply run the desired example like so:
```
$ crystal examples/core_basic_window.cr
```

## Credits

* raylib and original examples by [raysan5](https://github.com/raysan5).
* cray by [Zatherz](https://gitlab.com/Zatherz).
