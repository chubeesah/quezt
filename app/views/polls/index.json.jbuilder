json.polls do
    json.array! @polls do |polls| 
        json.id polls.id
        json.user_id polls.user_id
        json.username polls.username
        json.question polls.question
        json.photo polls.photo_post
        json.answer_1 polls.answer_1
        json.answer_2 polls.answer_2
        json.answer_3 polls.answer_3
        json.answer_4 polls.answer_4
        json.vote_1 polls.vote_1
        json.vote_2 polls.vote_2
        json.vote_3 polls.vote_3
        json.vote_4 polls.vote_4
        json.latitude polls.latitude
        json.longitude polls.longitude
    end
end
