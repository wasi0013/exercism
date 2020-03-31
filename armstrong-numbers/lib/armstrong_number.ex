defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    exponent = length(Integer.digits(number))
    Enum.sum(Enum.map(Integer.digits(number), &:math.pow(&1, exponent))) == number
  end
end
