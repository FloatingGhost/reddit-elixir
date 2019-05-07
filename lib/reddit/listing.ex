defmodule Reddit.Listing do
  @moduledoc """
  Functions for dealing with a "listing" object - reddit's way of
  paginating long result sets
  """

  @doc """
  Get the next page of a listing

      iex> {:ok, resp} = Reddit.Subreddit.top_posts(client, "evangelion")
      iex> {:ok, next_page} = Reddit.Listing.next_page(resp)
  """
  def next_page(
        %{__client__: cli, url: url, query: query, body: %{"data" => %{"after" => a}}},
        opts \\ []
      )
      when not is_nil(a) do
    params =
      query
      |> Keyword.merge(opts)
      |> Keyword.merge(after: a)

    Tesla.get(cli, url, query: params)
  end
end
