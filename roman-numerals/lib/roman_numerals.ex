defmodule RomanNumerals do
  @mapping %{
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) when number < 1 do
    ""
  end

  def numeral(number) do
    [head | tail] = Enum.reverse(Enum.filter(@mapping, fn {k, v} -> number >= k end))
    {key, value} = head
    value <> numeral(number - key)
  end
end
