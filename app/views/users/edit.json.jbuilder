json.user do
  json.username @user.username
  json.email @user.email
  json.authentication_token @user.authentication_token
end