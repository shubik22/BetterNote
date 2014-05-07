json.(note, :id, :title, :body, :notebook_id, :created_at, :updated_at)
json.notebook note.notebook.name
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
json.note_tags do
  json.array!(note.note_tags) do |note_tag|
    json.partial! "note_tags/show.json", note_tag: note_tag
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
