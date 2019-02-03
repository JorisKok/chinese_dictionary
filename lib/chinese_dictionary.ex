defmodule ChineseDictionary do
  Code.require_file("../lib/dictionary/c_e_dict.exs", __DIR__)
  @moduledoc """
  Documentation for ChineseDictionary.
  """

  @doc """
  Translates Chinese characters to English
  Returns a list of translations
  """
  def chinese_to_english(chinese) do
    ChineseDictionary.CEDict.chinese_to_english(chinese)
  end
end
