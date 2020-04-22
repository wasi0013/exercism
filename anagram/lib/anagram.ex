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
  def anagram?(word, candidate), do: Enum.sort(String.graphemes(word)) == Enum.sort(String.graphemes(candidate))

end
