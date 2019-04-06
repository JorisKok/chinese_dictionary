defmodule ChineseDictionary.Dict do
  @moduledoc false
  def get_from_simplified(simplified) do
    get("simplified", simplified)
  end

  def get_from_traditional(traditional) do
    get("traditional", traditional)
  end

  defp get(column, value) do
    case Sqlitex.with_db(
           'lib/dictionary/dict.sqlite3',
           fn db ->
             {:ok, statement} =
               Sqlitex.Statement.prepare(db, "SELECT * FROM translations WHERE #{column} LIKE ?")

             Sqlitex.Statement.bind_values(statement, [value])

             Sqlitex.Statement.fetch_all(statement)
           end
         ) do
      {:ok, result} ->
        Enum.map(
          result,
          fn item ->
            {item[:SIMPLIFIED], item[:TRADITIONAL], item[:PINYIN], item[:TRANSLATION]}
          end
        )

      _ ->
        nil
    end
  end
end
