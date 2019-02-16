# ChineseDictionary

[![Build Status](https://travis-ci.org/JorisKok/chinese_dictionary.svg?branch=master)](https://travis-ci.org/JorisKok/chinese_dictionary)

Docs: [https://hexdocs.pm/chinese_dictionary](https://hexdocs.pm/chinese_dictionary).


### How to use

```
alias ChineseDictionary
```

##### Simplified
```
translation = ChineseDictionary.chinese_simplified_to_english("学习")

```

##### Traditional
```
translation = ChineseDictionary.chinese_traditional_to_english("學習")
```

```elixir
def deps do
  [
    {:chinese_dictionary, "~> 0.1.0"}
  ]
end
```
