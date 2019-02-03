defmodule ChineseDictionaryTest do
  use ExUnit.Case
  alias ChineseDictionary
  import AssertValue

  describe "Translate Chinese to English" do
    test "Translate 㱾" do
      assert_value ChineseDictionary.chinese_to_english("㱾") == [
                     "gai1 - a kind of metal or jade ornament worn in ancient times to ward off evil spirits"
                   ]
    end

    test "Translate 㲈" do
      assert_value ChineseDictionary.chinese_to_english("㲈") == [
                     "shao2 - variant of 韶[shao2]",
                     "tao2 - variant of 鞀[tao2]"
                   ]
    end

    test "Translate 㲋" do
      assert_value ChineseDictionary.chinese_to_english("㲋") == [
                     "chuo4 - ancient name for an animal similar to rabbit but bigger"
                   ]
    end
  end
end
