json.poll do 
    json.id @poll.id
    json.question @poll.question
    json.photo @poll.photo_post
    json.answer_1 @poll.answer_1
    json.answer_2 @poll.answer_2
    json.answer_3 @poll.answer_3
    json.answer_4 @poll.answer_4
    json.vote_1 @poll.vote_1
    json.vote_2 @poll.vote_2
    json.vote_3 @poll.vote_3
    json.vote_4 @poll.vote_4
end