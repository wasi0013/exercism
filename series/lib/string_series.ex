defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) when size < 1 or size > length(s) do
    []
  end

  def slices(s, size) do
    for i <- 0..String.length(s) do
      String.slice(s, i, size)
    end
    |> Enum.filter(&(String.length(&1) == size))
  end
end
