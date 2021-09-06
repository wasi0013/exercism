defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(1), do: 2
  def nth(count) when count >= 2, do: get_prime(count * count) |> Enum.at(count-2)

  def get_prime(number), do: Stream.iterate(3, & &1 + 2) |> Enum.take(number) |> Enum.filter(&is_prime?/1)

  def is_prime?(n), do: length(Enum.filter(2..n, fn x -> rem(n, x) == 0 end)) == 1 

end
