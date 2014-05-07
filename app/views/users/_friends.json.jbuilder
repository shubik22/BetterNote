json.array!(friends) do |friend|
  json.username friend.username
  json.id friend.id
  json.notes do
    json.array!(friend.notes) do |note|
      json.partial! "notes/show.json", note: note
      json.note_type "friend"
    end
  end
end