json.user do
  json.id @user.id
  json.first_name @user.username
  json.email @user.email
  json.avatar @user.avatar
  json.authentication_token @user.authentication_token
end