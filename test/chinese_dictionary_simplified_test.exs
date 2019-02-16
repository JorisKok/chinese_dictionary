defmodule ChineseDictionarySimplifiedTest do
  use ExUnit.Case
  alias ChineseDictionary
  import AssertValue

  describe "Translate Chinese to English" do
    test "Translate 㱾" do
      assert_value(
        ChineseDictionary.chinese_simplified_to_english("㱾") == [
          "gai1 - a kind of metal or jade ornament worn in ancient times to ward off evil spirits"
        ]
      )
    end

    test "Translate 㲈" do
      assert_value(
        ChineseDictionary.chinese_simplified_to_english("㲈") == [
          "shao2 - variant of 韶[shao2]",
          "tao2 - variant of 鞀[tao2]"
        ]
      )
    end

    test "Translate 㲋" do
      assert_value(
        ChineseDictionary.chinese_simplified_to_english("㲋") == [
          "chuo4 - ancient name for an animal similar to rabbit but bigger"
        ]
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

    test "Translate 池上" do
      assert_value(
        ChineseDictionary.chinese_simplified_to_english("池上") == [
          "Chi2 shang4 - Chihshang or Chihshang township in Taitung County 臺東縣|台东县[Tai2 dong1 Xian4], southeast Taiwan"
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

    test "Translate 龙舌兰酒" do
      assert_value(
        ChineseDictionary.chinese_simplified_to_english("龙舌兰酒") == [
          "long2 she2 lan2 jiu3 - tequila"
        ]
      )
    end

    test "Translate 龙州" do
      assert_value(
        ChineseDictionary.chinese_simplified_to_english("龙州") == [
          "Long2 zhou1 - Longzhou county in Chongzuo 崇左[Chong2 zuo3], Guangxi"
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
end
