defmodule ChineseDictionary do
  Code.require_file("../lib/dictionary/c_e_dict.exs", __DIR__)

  @moduledoc """
  Documentation for ChineseDictionary.
  """

  @doc """
  Translates Simplified Chinese characters to English
  Returns a list of translations
  """
  def chinese_simplified_to_english(chinese) do
    ChineseDictionary.CEDict.get_from_simplified(chinese)
  end

  @doc """
  Translates Traditional Chinese characters to English
  Returns a list of translations
  """
  def chinese_traditional_to_english(chinese) do
    ChineseDictionary.CEDict.get_from_traditional(chinese)
  end
end
