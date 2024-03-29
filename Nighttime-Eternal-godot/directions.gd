class_name DirHelper

enum Direction {UP = -2, LEFT = -1, RIGHT = 1, DOWN = 2, ORIGIN = 0, ERROR = 3}


static func get_dir_vector(direction):
	match(direction):
		Direction.UP:
			return Vector2(0, -1)
		Direction.LEFT:
			return Vector2(-1, 0)
		Direction.RIGHT:
			return Vector2(1, 0)
		Direction.DOWN:
			return Vector2(0, 1)
		Direction.ORIGIN:
			return Vector2(0, 0)
		Direction.ERROR:
			return null

static func get_dir_from_vector(vector:Vector2):
	match(vector):
		Vector2(0, -1):
			return Direction.UP
		Vector2(-1, 0):
			return Direction.LEFT
		Vector2(1, 0):
			return Direction.RIGHT
		Vector2(0, 1):
			return Direction.DOWN
		Vector2(0, 0):
			return Direction.ORIGIN
		_:
			return Direction.ERROR

static func get_opposite(direction):
	if direction == Direction.ERROR:
		return null
	return -direction
