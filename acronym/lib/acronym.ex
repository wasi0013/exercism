defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split()
    |> Enum.map(&capitalize(&1))
    |> Enum.map(&Enum.filter(&1, fn c -> c == String.upcase(c) and c =~ ~r/[A-Z]/ end))
    |> Enum.join()
  end

  def capitalize(string) do
    [head | tail] = string |> String.graphemes()

    if String.upcase(string) == string do
      [head | Enum.map(tail, &String.downcase(&1))]
    else
      [String.capitalize(head) | tail]
    end
  end
end
