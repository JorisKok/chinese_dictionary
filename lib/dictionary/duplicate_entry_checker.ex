defmodule ChineseDictionary.DuplicateEntryChecker do
  @moduledoc false
  use Agent

  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  def get_counter(bucket) do
    Agent.get(bucket, &Map.get(&1, :counter))
  end

  def get_character(bucket) do
    Agent.get(bucket, &Map.get(&1, :character))
  end

  def new_character(bucket) do
    Agent.update(bucket, &Map.put(&1, :counter, 0))
  end

  def put_character(bucket, character) do
    Agent.update(bucket, &Map.put(&1, :character, character))
  end

  def same_character(bucket, count) do
    Agent.update(bucket, &Map.put(&1, :counter, count + 1))
  end

  def check_character(bucket, character) do
    case get_character(bucket) do
      same when same == character ->
        same_character(bucket, get_counter(bucket))

      _new ->
        new_character(bucket)
    end
  end
end
