json.polls do
  json.array! @polls do
    json.latitude @polls.latitude
    json.longitude @polls.longitude
  end
end