json.array!(@notebooks) do |notebook|
  json.partial! "notebooks/show", notebook: notebook
end