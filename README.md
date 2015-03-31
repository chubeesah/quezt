== README

## Quezt

## API End Point

<strong>https://quezt.herokuapp.com</strong>



##Routes
```
Prefix Verb   URI Pattern                    Controller#Action
        new_user_session GET    /users/sign_in(.:format)       sessions#new
            user_session POST   /users/sign_in(.:format)       sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)      sessions#destroy
           user_password POST   /users/password(.:format)      devise/passwords#create
       new_user_password GET    /users/password/new(.:format)  devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
                         PATCH  /users/password(.:format)      devise/passwords#update
                         PUT    /users/password(.:format)      devise/passwords#update
cancel_user_registration GET    /users/cancel(.:format)        registrations#cancel
       user_registration POST   /users(.:format)               registrations#create
   new_user_registration GET    /users/sign_up(.:format)       registrations#new
  edit_user_registration GET    /users/edit(.:format)          registrations#edit
                         PATCH  /users(.:format)               registrations#update
                         PUT    /users(.:format)               registrations#update
                         DELETE /users(.:format)               registrations#destroy
                    user GET    /users/:id(.:format)           users#show
               edit_user PATCH  /users/:id(.:format)           users#edit
            destroy_user DELETE /users/:id(.:format)           users#destroy
                new_poll POST   /users/:id/polls(.:format)     polls#create
                   polls GET    /users/:id/polls(.:format)     polls#index
                    poll GET    /users/:id/polls/:id(.:format) polls#show
            destroy_poll DELETE /users/:id/polls/:id(.:format) polls#destroy
                    root GET    /                              home#index
```

#USERS

##**sign up/create user**

####Request

`POST /users`

```json
"user": {
  "username": "username",
  "email": "something@somewhere.com",
  "password": "password"
}
```

####Response
`Status: 201 Created`

creates a user, returns a success message and the following...

```json
{
"user": {
     "id": 1
     "username": "username",
     "email": "something@somewhere.com",
     "authentication_token": "XXXxxXxxXXxxXxxXXXx"
    }
}
```
##**sign in**

####Request

`POST /users/sign_in`

```json
"user": {
     "username": "username",
     "password": "password",
}
```

####Response
`Status: 200 OK`

sign in a user and returns the following...

```json
{
"user": {
     "username": "username",
     "email": "something@somewhere.com",
     "authentication_token": "XXXxxXxxXXxxXxxXXXx"
    }
}
```
##**sign out**

####Request

`DELETE /users/sign_out`

signs a user out. Does not return any response

##**create a poll**

####Request

`POST /users/:id/polls`

```json
{
"poll": {
        "question": "How do I look?",
        "photo": "/some/photo/file",
        "answer_1": "Good",
        "answer_2": "Okay",
        "answer_3": "Seen better",
        "answer_4": "BAD!",
    }
}
```

####Response
`Status 201 Created`

a user can add a poll

```json
{
"poll": {
        "id": 1,
        "username": null,
        "question": "How do I look?",
        "photo": "/some/photo/file/on/amazon/aws/s3/website",
        "answer_1": "Good",
        "answer_2": "Okay",
        "answer_3": "Seen better",
        "answer_4": "BAD!",
        "vote_1": null,
        "vote_2": null,
        "vote_3": null,
        "vote_4": null
    }
}
```
##**find a specific poll for a user**

####Request

`GET /users/:id/polls/:id`

```json
{
    "auth_token": "XXXxxXxxXXxxXxxXXXx"
}
```

####Response
`200 OK`

returns a specific poll for a user

```json
{
"poll": {
      "id": 1,
      "username": null,
      "question": "How do I look?",
      "photo": "/some/photo/file/on/amazon/aws/s3/website",
      "answer_1": "Good",
      "answer_2": "Okay",
      "answer_3": "Seen better",
      "answer_4": "BAD!",
      "vote_1": null,
      "vote_2": null,
      "vote_3": null,
      "vote_4": null
  }
}
```
##**list all polls**

####Request

`GET /users/:id/polls`

```json
{
    "auth_token": "XXXxxXxxXXxxXxxXXXx"
}
```

####Response
`200 OK`

shows a list of all polls...

```json
{
    "polls": [
           {
      "id": 1,
      "username": null,
      "question": "How do I look?",
      "photo": "/some/photo/file/on/amazon/aws/s3/website",
      "answer_1": "Good",
      "answer_2": "Okay",
      "answer_3": "Seen better",
      "answer_4": "BAD!",
      "vote_1": null,
      "vote_2": null,
      "vote_3": null,
      "vote_4": null
  }
 {
      "id": 2,
      "username": null,
      "question": "How's the weather?",
      "photo": "/some/photo/file/on/amazon/aws/s3/website",
      "answer_1": "Clear",
      "answer_2": "Partly Cloudy",
      "answer_3": "Dreary",
      "answer_4": "Rain Go Away!",
      "vote_1": null,
      "vote_2": null,
      "vote_3": null,
      "vote_4": null
  }
 {
      "id": 3,
      "username": null,
      "question": "What color should I pick?",
      "photo": "/some/photo/file/on/amazon/aws/s3/website",
      "answer_1": "Green",
      "answer_2": "Blue",
      "answer_3": "Red",
      "answer_4": "Black",
      "vote_1": null,
      "vote_2": null,
      "vote_3": null,
      "vote_4": null
  }
}
    ]
}
```
##**allows a user to delete a poll**

####Request

`DELETE /users/:id/polls/:id`

```json
{
    "auth_token": "XXXxxXxxXXxxXxxXXXx"
}
```

####Response
`200 OK`

user deletes a specific poll

```json
{
    "message": "Poll successfully deleted"
}
```
##**allows a user to delete a poll**

####Request

`PUT /users/:id/polls/:id`

```json
{
"poll": {
        "answer_1": "Good",
        "answer_2": "Okay",
        "answer_3": "Seen better",
        "answer_4": "BAD!",
    }
}
```

####Response
`200 OK`
```json
{
"poll": {
        "id": 1,
        "username": null,
        "question": "How do I look?",
        "photo": "/some/photo/file/on/amazon/aws/s3/website",
        "answer_1": "Good",
        "answer_2": "Okay",
        "answer_3": "Seen better",
        "answer_4": "BAD!",
        "vote_1": 0,
        "vote_2": 0,
        "vote_3": 0,
        "vote_4": 0
    }
}
```
