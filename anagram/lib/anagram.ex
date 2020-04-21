defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    candidates 
    |> Enum.filter(&anagram?(String.downcase(base), String.downcase(&1)))
  end

  def anagram?(word, word), do: false
  def anagram?(word, candidate), do: count_letters(word) == count_letters(candidate)

  def count_letters(word) do
    word = word |> String.graphemes() 
    Enum.map(word, &({&1, Enum.count(word, fn c -> c == &1 end)})) 
    |> Map.new()
  end 
end
