defmodule Mix.Tasks.DownloadDictionary do
  use Mix.Task

  @dictionary_link "https://raw.githubusercontent.com/JorisKok/chinese_dictionary/master/dictionary/dict.sqlite3"

  @shortdoc "Download the latest Chinese - English database"
  def run(_) do
    Mix.shell().info("Downloading database")
    HTTPoison.start
    %HTTPoison.Response{status_code: 200, body: body} = HTTPoison.get!(@dictionary_link)
    File.write!("lib/dictionary/dict.sqlite3", body)

    Mix.shell().info("Finished")
  end
end
