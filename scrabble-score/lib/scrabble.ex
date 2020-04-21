defmodule Scrabble do
  @letters [
    {"AEIOULNRST", 1},
    {"DG", 2},
    {"BCMP", 3},
    {"FHVWY", 4},
    {"K", 5},
    {"JX", 8},
    {"QZ", 10}
  ]
  @mapping Enum.reduce(
             @letters,
             %{},
             fn {letter, value}, mapping ->
               Map.merge(mapping, Map.new(Enum.map(String.graphemes(letter), &{&1, value})))
             end
           )

  @doc """
  Calculate the scrabble score for the wordi.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase()
    |> String.graphemes()
    |> Enum.map(&Map.get(@mapping, &1, 0))
    |> Enum.sum()
  end
end
