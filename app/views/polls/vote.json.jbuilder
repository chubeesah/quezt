json.poll do 
    json.id @poll.id
    json.user_id @poll.user_id
    json.username @poll.username
    json.vote_1 @poll.vote_1
    json.vote_2 @poll.vote_2
    json.vote_3 @poll.vote_3
    json.vote_4 @poll.vote_4
end