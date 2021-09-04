defmodule PhoneNumber do

  def clean(raw) do
    with {:ok, number} <- check_punctuation_letters(raw),
         {:ok, number} <- check_number_of_digits(number),
         {:ok, number} <- check_country_code(number),
         {:ok, number} <- check_area_code(number),
         {:ok, number} <- check_exchange_code(number)
    do  
          {:ok, number}
    else
        {:error, message} -> {:error, message}  
    end
  end
  def check_punctuation_letters(number) do
    if String.length(Enum.join(Regex.scan( ~r([@:!]|[a-zA-Z]), number))) != 0 do
       {:error, "must contain digits only"}
    else
       {:ok, number}
    end
  end 
  def check_number_of_digits(number) do
    number = Enum.join(Regex.scan( ~r(\d+), number))
    if String.length(number)==11 or String.length(number)==10 do
        {:ok, number}
    else
        {:error, "incorrect number of digits"}
    end
  end
  def check_country_code(number) do
        if String.length(number)==11 do
            if String.at(number, 0) != "1" do
              {:error, "11 digits must start with 1"}
            else
              {:ok, String.slice(number, 1..-1)}
            end
        else
            {:ok, number}
        end
  end
  def check_area_code(number) do
    case String.at(number, 0)do 
      "0" -> {:error, "area code cannot start with zero"}
      "1" -> {:error, "area code cannot start with one"}
      _  ->  {:ok, number}              
    end
  end
  def check_exchange_code(number) do
    case String.at(number, 3) do
      "0" -> {:error, "exchange code cannot start with zero"}
      "1" -> {:error, "exchange code cannot start with one"}
       _  -> {:ok, number} 
    end
  end
end