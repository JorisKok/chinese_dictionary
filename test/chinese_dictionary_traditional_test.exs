defmodule ChineseDictionaryTraditionalTest do
  use ExUnit.Case
  alias ChineseDictionary
  import AssertValue

  describe "Translate Chinese to English" do
    test "Translate 書" do
      assert_value(
        ChineseDictionary.chinese_traditional_to_english("書") == [
          "Shu1 - abbr. for 書經|书经[Shu1 jing1]",
          "shu1 - book/letter/document/CL:本[ben3],冊|册[ce4],部[bu4]/to write"
        ]
      )
    end

    test "Translate 繁體字" do
      assert_value(
        ChineseDictionary.chinese_traditional_to_english("繁體字") == [
          "fan2 ti3 zi4 - traditional Chinese character"
        ]
      )
    end

    test "Translate 荷蘭" do
      assert_value(
        ChineseDictionary.chinese_traditional_to_english("荷蘭") == [
          "He2 lan2 - Holland/the Netherlands"
        ]
      )
    end

    test "Translate 美國人" do
      assert_value(
        ChineseDictionary.chinese_traditional_to_english("美國人") == [
          "Mei3 guo2 ren2 - American/American person/American people/CL:個|个[ge4]"
        ]
      )
    end

    test "Translate 準備" do
      assert_value(
        ChineseDictionary.chinese_traditional_to_english("準備") == [
          "zhun3 bei4 - preparation/to prepare/to intend/to be about to/reserve (fund)"
        ]
      )
    end
  end
end
