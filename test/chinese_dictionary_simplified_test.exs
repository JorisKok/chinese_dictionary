defmodule ChineseDictionarySimplifiedTest do
  use ExUnit.Case
  alias ChineseDictionary
  import AssertValue

  describe "Translate Chinese to English" do
    test "Translate 化石" do
      assert_value(
        ChineseDictionary.chinese_simplified_to_english("化石") == ["hua4 shi2 - fossil"]
      )
    end

    test "Translate 一团乱糟" do
      assert_value(
        ChineseDictionary.chinese_simplified_to_english("一团乱糟") == [
          "yi1 tuan2 luan4 zao1 - a chaotic mess"
        ]
      )
    end

    test "Translate 活下" do
      assert_value(
        ChineseDictionary.chinese_simplified_to_english("活下") == ["huo2 xia4 - to survive"]
      )
    end

    test "Translate 池" do
      assert_value(
        ChineseDictionary.chinese_simplified_to_english("池") == [
          "Chi2 - surname Chi",
          "chi2 - pond/reservoir/moat"
        ]
      )
    end

    test "Translate 派遣" do
      assert_value(
        ChineseDictionary.chinese_simplified_to_english("派遣") == [
          "pai4 qian3 - to send (on a mission)/to dispatch"
        ]
      )
    end

    test "Translate 雀" do
      assert_value(
        ChineseDictionary.chinese_simplified_to_english("雀") == [
          "qiao1 - a freckle/lentigo",
          "que4 - small bird/sparrow/also pr. [qiao3]"
        ]
      )
    end

    test "Translate 活着" do
      assert_value(ChineseDictionary.chinese_simplified_to_english("活着") == ["huo2 zhe5 - alive"])
    end

    test "Translate 北京周报" do
      assert_value(
        ChineseDictionary.chinese_simplified_to_english("北京周报") == [
          "Bei3 jing1 Zhou1 bao4 - Beijing Review/also written 北京週報|北京周报"
        ]
      )
    end

    test "Translate 鼠" do
      assert_value(
        ChineseDictionary.chinese_simplified_to_english("鼠") == [
          "shu3 - rat/mouse/CL:隻|只[zhi1]"
        ]
      )
    end

    test "Translate 默剧" do
      assert_value(
        ChineseDictionary.chinese_simplified_to_english("默剧") == [
          "mo4 ju4 - dumb show/mime"
        ]
      )
    end

    test "Translate 黑顶奇鹛" do
      assert_value(
        ChineseDictionary.chinese_simplified_to_english("黑顶奇鹛") == [
          "hei1 ding3 qi2 mei2 - (bird species of China) black-headed sibia (Heterophasia desgodinsi)"
        ]
      )
    end
  end

  describe "Test if not found" do
    test "Some english word" do
      assert_value(
        ChineseDictionary.chinese_simplified_to_english("Nothing") == []
      )
    end
  end
end
