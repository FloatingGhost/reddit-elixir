# Reddit

An elixir wrapper to reddit's API, not forcing genservers on you as a bonus

## Usage

Configure your credentials in `config/` as per usual, in the form

```elixir
config :reddit, :oauth,
    client_id: "my_id",
    secret: "deadbeef",
    username: "well_acktually",
    password: "password123"
```

Credentials can be passed dynamically if you require, see the docs for details.

Now you can get to work

```elixir
iex> {:ok, client} = Reddit.Client.login()
{:ok, %Tesla.Client{}}
iex> {:ok, response} = Reddit.Subreddit.top_posts(client, "evangelion")
{:ok, %Tesla.Env{status: 200, body: %{...}})
iex> Reddit.Listing.next_page(response, limit: 5)
{:ok, %Tesla.Env{status: 200, body: %{...}})
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `reddit` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:reddit, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/reddit](https://hexdocs.pm/reddit).

