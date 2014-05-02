json.array!(notes) do |note|
  json.partial! "notes/show.json", note: note
end