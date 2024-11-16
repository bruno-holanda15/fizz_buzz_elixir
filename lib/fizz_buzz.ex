defmodule FizzBuzz do
  def build(file_name) do
    # Work with case
    #  case File.read(file_name) do
    #    {:ok, result} -> result
    #    {:error, reason} -> reason
    #  end

    # Not looking like elixir
    # file = File.read(file_name)
    # handle_file_read(file)

    # Looking like elixir
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    # list = String.split(result, ",") # "1,2,3,4" -> [1,2,3,4]
    # # Enum.map(list, fn number -> String.to_integer(number) end)
    # Enum.map(list, &String.to_integer/1) map get item from list, and pass to to_integer

    # Looking like elixir
    result =
      result
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error while reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(elem) do
    elem
    |> String.to_integer()
    |> evaluate_number()
  end

  defp evaluate_number(number) when rem(number, 5) == 0 and rem(number, 3) == 0, do: :fizzbuzz
  defp evaluate_number(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_number(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_number(number), do: number
end
