json.array! @tags do |tag|
  json.partial! "tags/show", tag: tag
end