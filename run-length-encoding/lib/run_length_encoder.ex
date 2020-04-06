defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(""), do: ""
  def encode(string), do: encode(String.slice(string, 1..-1), {String.at(string, 0), 1})
  def encode("", {key, value}), do: if(value == 1, do: "#{key}", else: "#{value}#{key}")

  def encode(string, {key, value}) do
    if String.at(string, 0) == key do
      encode(String.slice(string, 1..-1), {key, value + 1})
    else
      if(value == 1, do: "#{key}", else: "#{value}#{key}") <>
        encode(String.slice(string, 1..-1), {String.at(string, 0), 1})
    end
  end

  @spec decode(String.t()) :: String.t()
  def decode(""), do: ""

  def decode(string) do
    Regex.scan(~r/(\d+)(.)/, string)
    |> Enum.reduce(string, fn [matched, number, str], acc ->
        String.replace(acc, matched, String.duplicate(str, String.to_integer(number)), global: false)
    end )
  end
end
