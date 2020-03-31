defmodule RobotSimulator do
  @valid_directions [:north, :east, :south, :west]
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
    cond do
      Enum.member?(@valid_directions, direction) == false ->
        {:error, "invalid direction"}

      not_valid?(position) ->
        {:error, "invalid position"}

      true ->
        %{
          :direction => direction,
          :position => position
        }
    end
  end

  def not_valid?({x, y}) do
    (is_integer(x) and is_integer(y) == true) == false
  end

  def not_valid?(_) do
    true
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, "L" <> instructions) do
    case robot.direction do
      :east -> Map.update!(robot, :direction, fn _ -> :north end) |> simulate(instructions)
      :west -> Map.update!(robot, :direction, fn _ -> :south end) |> simulate(instructions)
      :north -> Map.update!(robot, :direction, fn _ -> :west end) |> simulate(instructions)
      :south -> Map.update!(robot, :direction, fn _ -> :east end) |> simulate(instructions)
    end
  end

  def simulate(robot, "R" <> instructions) do
    case robot.direction do
      :east -> Map.update!(robot, :direction, fn _ -> :south end) |> simulate(instructions)
      :west -> Map.update!(robot, :direction, fn _ -> :north end) |> simulate(instructions)
      :north -> Map.update!(robot, :direction, fn _ -> :east end) |> simulate(instructions)
      :south -> Map.update!(robot, :direction, fn _ -> :west end) |> simulate(instructions)
    end
  end

  def simulate(robot, "A" <> instructions) do
    case robot.direction do
      :east ->
        Map.update!(robot, :position, fn {x, y} -> {x + 1, y} end) |> simulate(instructions)

      :west ->
        Map.update!(robot, :position, fn {x, y} -> {x - 1, y} end) |> simulate(instructions)

      :north ->
        Map.update!(robot, :position, fn {x, y} -> {x, y + 1} end) |> simulate(instructions)

      :south ->
        Map.update!(robot, :position, fn {x, y} -> {x, y - 1} end) |> simulate(instructions)
    end
  end

  def simulate(robot, "") do
    robot
  end

  def simulate(robot, _) do
    {:error, "invalid instruction"}
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot.direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot.position
  end
end
