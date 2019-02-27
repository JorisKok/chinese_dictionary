defmodule ChineseDictionary.CEDict do
  @moduledoc false

  @external_resource dictionary = Path.join([__DIR__, "cedict.txt"])

  for line <- File.stream!(dictionary, [], :line) do
    IO.inspect dictionary.count()
    expression =
      ~r/(?<traditional>.+?) (?<simplified>.+?) \[(?<pinyin>.+)\] \/(?<translation>.+)(\/\n)/u

    case Regex.named_captures(expression, line) do
      %{} = value ->
        # Create the translate function
#        def translation(simplified, traditional, count)
#            when simplified == unquote(value["simplified"]) or
#                   traditional == unquote(value["traditional"]) or count == unquote(count) do
#          {
#            unquote(count),
#            unquote(value["simplified"]),
#            unquote(value["traditional"]),
#            unquote(value["pinyin"]) <> " - " <> unquote(value["translation"])
#          }
#        end
      nil

      _ ->
        nil
    end
  end

  def get_from_simplified(simplified) do
    get_from_simplified([], simplified, 0)
  end

  defp get_from_simplified(accumulator, character, counter) do
    try do
      case counter do
        0 ->
          {count, _simplified, _traditional, translation} = translation(character, nil, nil)
          get_from_simplified(accumulator ++ [translation], character, count + 1)

        _ ->
          {count, simplified, _traditional, translation} = translation(nil, nil, counter)

          if character !== simplified do
            raise "It's a different simplified character"
          end

          get_from_simplified(accumulator ++ [translation], character, count + 1)
      end
    rescue
      _ -> accumulator
    end
  end

  def get_from_traditional(traditional) do
    get_from_traditional([], traditional, 0)
  end

  defp get_from_traditional(accumulator, character, counter) do
    try do
      case counter do
        0 ->
          {count, _simplified, _traditional, translation} = translation(nil, character, nil)
          get_from_traditional(accumulator ++ [translation], character, count + 1)

        _ ->
          {count, _simplified, traditional, translation} = translation(nil, nil, counter)

          if character !== traditional do
            raise "It's a different simplified character"
          end

          get_from_traditional(accumulator ++ [translation], character, count + 1)
      end
    rescue
      _ -> accumulator
    end
  end
end
