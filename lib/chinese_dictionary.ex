defmodule ChineseDictionary do
  @moduledoc """
  Documentation for ChineseDictionary.
  """

  @doc ~S"""
  Translates Simplified Chinese characters to English
  Returns a list with tuples (simplified, traditional, pinyin, translation)
  ## Examples

      iex> ChineseDictionary.chinese_simplified_to_english("池")
          [
            {"池", "池", "Chi2", "surname Chi"},
            {"池", "池", "chi2", "pond/reservoir/moat"}
          ]

      iex> ChineseDictionary.chinese_simplified_to_english("Nothing")
          []

  """
  def chinese_simplified_to_english(chinese) do
    ChineseDictionary.Dict.get_from_simplified(chinese)
  end

  @doc ~S"""
  Translates Traditional Chinese characters to English
  Returns a list with tuples (simplified, traditional, pinyin, translation)
  ## Examples

      iex> ChineseDictionary.chinese_traditional_to_english("荷蘭")
          [
            {"荷兰", "荷蘭", "He2 lan2", "Holland/the Netherlands"}
          ]

      iex> ChineseDictionary.chinese_traditional_to_english("Nothing")
          []

  """
  def chinese_traditional_to_english(chinese) do
    ChineseDictionary.Dict.get_from_traditional(chinese)
  end
end
