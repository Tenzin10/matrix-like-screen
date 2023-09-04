defmodule MatrixWithElixir do
  def start do
    clear()
    loop(0)
  end

  defp loop(counter) when counter == 1000 do
    IO.puts("Loop ended.")
  end

  defp loop(counter) do
    {line, column} = {:rand.uniform(100), :rand.uniform(150)}
    IO.puts("#{IO.ANSI.cursor(line, column)} #{random_character()}")
    :timer.sleep(30)
    loop(counter + 1)
  end

  defp random_character do
    random_number = rem(:rand.uniform(4), 4)

    case random_number do
      0 -> ""
      1 -> random_digit()
      2 -> random_char()
      3 -> random_special_chars()
    end
  end

  defp random_digit do
    IO.ANSI.green() <> Integer.to_string(:rand.uniform(10))
  end

  defp random_char do
    random_char = :rand.uniform(26)
    IO.ANSI.green() <> :binary.encode_unsigned(random_char + 65)
  end

  defp random_special_chars do
    special_characters = "!@#$%^&*()_-+=[]{}|;:'\",.<>?/\\"
    size = String.length(special_characters)
    random_number = rem(:rand.uniform(size), size)
    IO.ANSI.green() <> String.at(special_characters, random_number)
  end

  defp clear do
    IO.ANSI.clear()
  end
end

MatrixWithElixir.start()
