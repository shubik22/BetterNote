json.array!(notes) do |note|
  json.(note, :id, :title, :body, :created_at, :updated_at)
  json.author do
    json.id note.author.id
    json.name note.author.username
  end
  json.notebook do
    json.partial! "notebooks/show.json", notebook: note.notebook
  end
  json.comments do
    json.array!(note.comments) do |comment|
      json.id comment.id
      json.body comment.body
      json.created_at comment.created_at
      json.updated_at comment.updated_at
      json.author do
        json.id comment.author.id
        json.name comment.author.username
      end
    end
  end
  json.tags do
    json.array!(note.tags) do |tag|
      json.partial! "tags/show.json", tag: tag
    end
  end
  json.likes do
    json.array!(note.likes) do |like|
      json.id like.id
      json.owner do
        json.id like.owner.id
        json.name like.owner.username
      end
    end
  end
end