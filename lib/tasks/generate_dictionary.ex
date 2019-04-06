defmodule Mix.Tasks.GenerateDictionary do
  use Mix.Task
  @moduledoc false

  def run(_) do
    Mix.shell().info("Creating database")

    Sqlitex.with_db(
      'lib/dictionary/dict.sqlite3',
      fn db ->
        db
        |> drop_table
        |> create_table
        |> insert_records
      end
    )

    Mix.shell().info("Created")
  end

  defp drop_table(db) do
    case Sqlitex.query(
           db,
           "DROP TABLE translations"
         ) do
      {:ok, _} -> db
      {:error, _} -> db
    end
  end

  defp create_table(db) do
    Sqlitex.query(
      db,
      "CREATE TABLE translations (
         ID INTEGER PRIMARY KEY AUTOINCREMENT,
         SIMPLIFIED TEXT,
         TRADITIONAL TEXT,
         PINYIN TEXT,
         TRANSLATION TEXT
        );"
    )

    db
  end

  defp insert_records(db) do
    dictionary = Path.join([File.cwd!(), "/lib/dictionary/cedict_1_0_ts_utf-8_mdbg.txt"])

    for line <- File.stream!(dictionary, [], :line) do
      expression =
        ~r/(?<traditional>.+?) (?<simplified>.+?) \[(?<pinyin>.+)\] \/(?<translation>.+)(\/\n)/u

      case Regex.named_captures(expression, line) do
        %{} = value ->
          {:ok, statement} =
            Sqlitex.Statement.prepare(
              db,
              "INSERT INTO translations (simplified, traditional, pinyin, translation) VALUES (?, ?, ?, ?);"
            )

          Sqlitex.Statement.bind_values(
            statement,
            [value["simplified"], value["traditional"], value["pinyin"], value["translation"]]
          )

          case Sqlitex.Statement.exec(statement) do
            :ok -> nil
            error -> IO.inspect(error)
          end

        _ ->
          nil
      end
    end
  end
end
