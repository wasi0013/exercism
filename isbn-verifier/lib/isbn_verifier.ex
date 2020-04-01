defmodule IsbnVerifier do
  @doc """
    Checks if a string is a valid ISBN-10 identifier

    ## Examples

      iex> ISBNVerifier.isbn?("3-598-21507-X")
      true

      iex> ISBNVerifier.isbn?("3-598-2K507-0")
      false

  """
  @spec isbn?(String.t()) :: boolean
  def isbn?(text) do
    if String.ends_with?(text, "X") do
      digits =
        Enum.map(
          Enum.filter(String.graphemes(String.replace(text, "X", "")), fn x ->
            Integer.parse(x) != :error
          end),
          &String.to_integer(&1)
        )

      if length(digits) == 9 do
        value = Enum.sum(Enum.map(Enum.zip(digits, 10..2), fn {x, y} -> x * y end)) + 10
        rem(value, 11) == 0
      end
    else
      digits =
        Enum.map(
          Enum.filter(String.graphemes(text), &(Integer.parse(&1) != :error)),
          &String.to_integer(&1)
        )

      if length(digits) == 10 do
        value = Enum.sum(Enum.map(Enum.zip(digits, 10..1), fn {x, y} -> x * y end))
        rem(value, 11) == 0
      end
    end
  end
end
