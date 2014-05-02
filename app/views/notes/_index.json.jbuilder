json.array!(notes) do |note|
  json.(note, :id, :title, :body, :created_at, :updated_at)
  json.notebook do
    json.partial! "notebooks/show.json", notebook: note.notebook
  end
  json.author do
    json.id note.author.id
    json.username note.author.username
  end
  json.comments do
    json.array!(note.comments) do |comment|
      json.id comment.id
      json.body comment.body
      json.created_at comment.created_at
      json.updated_at comment.updated_at
      json.author do
        json.id comment.author.id
        json.username comment.author.username
      end
    end
  end
  json.tags do
    json.array!(note.tags) do |tag|
      json.partial! "tags/show.json", tag: tag
    end
  end
  json.note_tags do
    json.array!(note.note_tags) do |note_tag|
      json.id note_tag.id
      json.note_id note_tag.note_id
      json.tag_id note_tag.tag_id
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