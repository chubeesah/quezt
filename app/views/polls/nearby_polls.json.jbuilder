json.polls do
  json.array! @polls do |polls|
    json.latitude polls.latitude
    json.longitude polls.longitude
  end
end