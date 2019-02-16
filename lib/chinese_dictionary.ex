defmodule ChineseDictionary do
  Code.require_file("../lib/dictionary/c_e_dict_simplified.exs", __DIR__)
  Code.require_file("../lib/dictionary/c_e_dict_traditional.exs", __DIR__)
  @moduledoc """
  Documentation for ChineseDictionary.
  """

  @doc """
  Translates Simplified Chinese characters to English
  Returns a list of translations
  """
  def chinese_simplified_to_english(chinese) do
    ChineseDictionary.CEDictSimplified.chinese_to_english(chinese)
  end

  @doc """
  Translates Traditional Chinese characters to English
  Returns a list of translations
  """
  def chinese_traditional_to_english(chinese) do
    ChineseDictionary.CEDictTraditional.chinese_to_english(chinese)
  end
end
