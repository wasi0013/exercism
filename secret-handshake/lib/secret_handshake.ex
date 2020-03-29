defmodule SecretHandshake do
  @actions ["wink", "double blink", "close your eyes", "jump", "reverse"]
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    Integer.to_charlist(code, 2)
    |> Enum.reverse()
    |> Enum.take(5)
    |> Enum.zip(@actions)
    |> Enum.reduce([], fn {code, value}, acc ->
      case code do
        49 -> if value == "reverse", do: Enum.reverse(acc), else: acc ++ [value]
        48 -> acc
      end
    end)
  end
end
