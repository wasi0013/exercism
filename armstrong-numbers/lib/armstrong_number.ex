defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    l = length(Integer.digits(number))
    Enum.sum(Enum.map(Integer.digits(number), &:math.pow(&1, l))) == number
  end
end
