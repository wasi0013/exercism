defmodule Matrix do
  defstruct columns: [], rows: []

  @doc """
  Convert an `input` string, with rows separated by newlines and values
  separated by single spaces, into a `Matrix` struct.
  """
  @spec from_string(input :: String.t()) :: %Matrix{}
  def from_string(input) do
    rows =
      Enum.map(
        String.split(input, "\n"),
        &Enum.map(String.split(&1), fn str -> String.to_integer(str) end)
      )

    columns = transpose(rows)

    %Matrix{
      columns: columns,
      rows: rows
    }
  end

  @doc """
  Write the `matrix` out as a string, with rows separated by newlines and
  values separated by single spaces.
  """
  @spec to_string(matrix :: %Matrix{}) :: String.t()
  def to_string(matrix),
    do:
      Enum.map(
        matrix.rows,
        fn row -> row |> Enum.map(&Integer.to_string(&1)) |> Enum.join(" ") end
      )
      |> Enum.join("\n")

  @doc """
  Given a `matrix`, return its rows as a list of lists of integers.
  """
  @spec rows(matrix :: %Matrix{}) :: list(list(integer))
  def rows(matrix) do
    matrix.rows
  end

  @doc """
  Given a `matrix` and `index`, return the row at `index`.
  """
  @spec row(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def row(matrix, index) do
    Enum.at(rows(matrix), index)
  end

  @doc """
  Given a `matrix`, return its columns as a list of lists of integers.
  """
  @spec columns(matrix :: %Matrix{}) :: list(list(integer))
  def columns(matrix) do
    matrix.columns
  end

  @doc """
  Given a `matrix` and `index`, return the column at `index`.
  """
  @spec column(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def column(matrix, index) do
    Enum.at(columns(matrix), index)
  end

  def transpose([[] | _]), do: []
  def transpose(list), do: [Enum.map(list, &hd/1) | transpose(Enum.map(list, &tl/1))]
end
