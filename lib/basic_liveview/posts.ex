defmodule BasicLiveview.Posts do
  import Ecto.Query, warn: false

  alias BasicLiveview.Repo
  alias BasicLiveview.Posts.Post

  def list_posts do
    query =
      from p in Post,
        select: p,
        order_by: [desc: :inserted_at],
        preload: [:user]

    Repo.all(query)
  end

  def save(post_params) do
    %Post{}
    |> Post.changeset(post_params)
    |> Repo.insert()
  end
end
