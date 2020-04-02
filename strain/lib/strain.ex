defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep([], _fun), do: []

  def keep([head | tail], fun),
    do: if(fun.(head), do: [head] ++ keep(tail, fun), else: keep(tail, fun))

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard([], _fun), do: []

  def discard([head | tail], fun),
    do: if(fun.(head), do: discard(tail, fun), else: [head] ++ discard(tail, fun))
end
