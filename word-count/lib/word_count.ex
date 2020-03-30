defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    words = sentence 
            |> String.downcase 
            |> String.replace(~r/[_]/u, " ")
            |> String.replace(~r/[:$,!&@%^]/u, "")
            |> String.split() 
            |> Enum.filter(&(&1!="")) 
    keys =  words |> MapSet.new
    Map.new(keys, fn word -> {word, Enum.count(words, &(&1==word))}end)
  end
end
