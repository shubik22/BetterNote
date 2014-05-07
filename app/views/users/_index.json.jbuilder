json.array!(users) do |user|
  json.id user.id
  json.username user.username
  if current_user.friendships.find_by({in_friend: user})
    json.status "friend"
  elsif current_user.friend_requests.find_by({in_friend: user})
    json.status "waiting"
  elsif current_user.friend_requests.find_by({out_friend: user})
    json.status "pending"
  else
    json.status "none"
  end
end