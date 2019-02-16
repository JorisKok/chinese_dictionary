defmodule ChineseDictionary.CEDictSimplified do
  import ChineseDictionary.DuplicateEntryChecker

  @moduledoc """
  Generates the CEDict module for simplified characters
  Split up traditional/simplified, because else we run out of memory
  For each entry it generates a function
  There are duplicate entries in the dictionary
  So we create a function with an entry identifier
  So can try to check if there are more entries via
  chinese_to_english(character, 0)
  chinese_to_english(character, 1)
  ... etc
  And then combine the results
  """
  @external_resource dictionary = Path.join([__DIR__, "cedict_ts.u8"])

  {:ok, bucket} = ChineseDictionary.DuplicateEntryChecker.start_link([])

  for line <- File.stream!(dictionary, [], :line) do
    expression = ~r/(?<traditional>.+?) (?<simplified>.+?) \[(?<pinyin>.+)\] \/(?<translation>.+)(\/\n)/u

    case Regex.named_captures(expression, line) do
      %{} = value ->
        # Check if the character already exists
        check_character(bucket, value["simplified"])

        # Create the translate function
        def chinese_to_english(unquote(value["simplified"]), unquote(get_counter(bucket))) do
          unquote(value["pinyin"]) <> " - " <> unquote(value["translation"])
        end

        # Update the helper
        put_character(bucket, value["simplified"])
      _ -> nil
    end
  end

  @doc """
  The Chinese dictionary entry point
  """
  def chinese_to_english(character) do
    get_translation([], character, 0)
  end

  # Get all the translations for the definition,
  # they are defined by chinese_to_english(character,0)
  # where 0 is incremented for each definition
  defp get_translation(accumulator, character, counter) do
    try do
      accumulator ++ [chinese_to_english(character, counter)]
      |> get_translation(character, counter + 1)
    rescue
      _ ->
        # If the function is not defined
        accumulator
    end
  end
end
