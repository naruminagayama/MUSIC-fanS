json.array! @songs do |song|
  json.id song.id
  json.sale_year song.sale_year
  json.name song.name
  json.image_id song.image_id.url
  json.detail song.detail
end