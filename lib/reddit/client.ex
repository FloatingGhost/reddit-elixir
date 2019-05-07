defmodule Reddit.Client do
  defp auth_client(client_id, client_secret) do
    middleware = [
      {Tesla.Middleware.BaseUrl, "https://www.reddit.com/api/v1/"},
      Tesla.Middleware.FormUrlencoded,
      Tesla.Middleware.JSON,
      {Tesla.Middleware.Headers, [{"User-Agent", "reddit-elixir"}]},
      {Tesla.Middleware.BasicAuth, username: client_id, password: client_secret}
    ]

    Tesla.client(middleware)
  end

  defp request_token(client, username, password) do
    post_body = %{
      grant_type: "password",
      username: username,
      password: password
    }

    client
    |> Tesla.post("/access_token", post_body)
  end

  defp authenticated_client(token) do
    middleware = [
      {Tesla.Middleware.BaseUrl, "https://oauth.reddit.com/"},
      Tesla.Middleware.JSON,
      {Tesla.Middleware.Headers,
       [
         {"User-Agent", "reddit-elixir"},
         {"Authorization", "bearer #{token}"}
       ]}
    ]

    Tesla.client(middleware)
  end

  @doc """
  Log in using application env, returns a client with the token applied

      iex> login()
      {:ok, %Tesla.Client{}}
  """
  def login do
    config = Application.get_env(:reddit, :oauth)
    login(config[:client_id], config[:secret], config[:username], config[:password])
  end

  @doc """
  Log in using specified credentials, returns a client with the token applie

      iex> login(client_id, secret, username, password)
      {:ok, %Tesla.Client{}}
  """
  def login(client_id, secret, username, password) do
    auth_client(client_id, secret)
    |> request_token(username, password)
    |> case do
      {:ok, %{status: 200, body: %{"access_token" => token}}} ->
        {:ok, authenticated_client(token)}

      {:ok, %{status: _status} = req} ->
        {:error, req}

      {:error, reason} ->
        {:error, reason}
    end
  end
end
