defmodule GithubApi.Base do
  alias HTTPotion.Response, as: Response

  @user_agent [ "User-agent": "Elixir neektza@gmail.com" ]

  def process(url) do
    fetch(url)
    |> decode
    |> to_hashdicts
  end

  def fetch(url) do
    case HTTPotion.get(url, @user_agent) do
      Response[body: body, status_code: status, headers: _headers ] when status in 200..299 ->
        { :ok, body }
      Response[body: body, status_code: _status, headers: _headers ] ->
        { :error, body }
    end
  end

  def decode({:ok, body}) do
    Jsonex.decode(body)
  end

  def decode({:error, msg}) do
    "Error fetching from Github: #{Jsonex.decode(msg)["message"]}"
  end

  def to_hashdicts(list) do
    list |> Enum.map(&HashDict.new/1)
  end

end
