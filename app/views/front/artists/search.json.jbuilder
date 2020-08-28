json.array! @artists do |artist|
  json.id artist.id
  json.name artist.name
  json.image_id artist.image_id.url
  json.detail artist.detail
end