defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    Enum.map(String.to_charlist(text), fn n -> 
      cond do
        (n >= 65 and n <= 91) ->  65 + rem(n-65+shift, 26)
        (n >= 97 and n <=123) ->  97 + rem(n-97+shift, 26)
        true -> n
      end

    end)
    |> to_string
  end
    end
