defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) when number <= 99 and number > 1 do
    # Your implementation here...
    t = if number == 2, do: "", else: "s"
    "#{number} bottles of beer on the wall, #{number} bottles of beer.
Take one down and pass it around, #{number - 1} bottle#{t} of beer on the wall.\n"
  end

  def verse(number) when number == 1 do
    "1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def verse(number) when number == 0 do
    "No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range) do
    # Your implementation here...
    for i <- range do
      verse(i)
    end
    |> Enum.join("\n")
  end

  def lyrics() do
    lyrics(99..0)
  end
end
