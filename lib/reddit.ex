defmodule Reddit do
  @moduledoc """
  A wrapper around reddit's API

  Only exists because all of the other clients either didn't work
  or were genservers. I mean, seriously? Genservers. For an HTTP
  wrapper. Bleh.

  Generic usage:

        config :reddit, :oauth,
            client_id: "my_id",
            secret: "deadbeef",
            username: "well_acktually",
            password: "password123"

        iex> {:ok, client} = Reddit.Client.login()
        {:ok, %Tesla.Client{}}
        iex> {:ok, response} = Reddit.Subreddit.top_posts(client, "evangelion")
        {:ok, %Tesla.Env{status: 200, body: %{...}})
        iex> Reddit.Listing.next_page(response, limit: 5)
        {:ok, %Tesla.Env{status: 200, body: %{...}})
  """
end
