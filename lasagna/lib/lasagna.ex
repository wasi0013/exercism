defmodule Lasagna do
  def expected_minutes_in_oven(), do: 40
  def remaining_minutes_in_oven(m), do: expected_minutes_in_oven() - m
  def preparation_time_in_minutes(m), do: m * 2
  def total_time_in_minutes(r, m), do: m + preparation_time_in_minutes(r)
  def alarm(), do: "Ding!"
end
