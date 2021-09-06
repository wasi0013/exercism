defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: 8.0 * hourly_rate |> Float.round(1)

  def apply_discount(before_discount, discount), do: before_discount - before_discount * discount/100 

  def monthly_rate(hourly_rate, discount), do: apply_discount(daily_rate(hourly_rate), discount) * 22.0 |> Float.ceil(0) |> round

  def days_in_budget(budget, hourly_rate, discount), do: budget/apply_discount(daily_rate(hourly_rate), discount) |> Float.floor(1)
end
