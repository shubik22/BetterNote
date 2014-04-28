User.create({
  username: "Jon Bon Jovi",
  email: "jbj@betternote.com",
  password: "password"
})

20.times do
  User.create({
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: "password"
  })
end

200.times do
  user = User.all.sample
  user.notebooks.create({
    name: Faker::Lorem.words(4).join(" ").capitalize
  })
end

500.times do
  user = User.all.sample
  next if user.notebooks.length == 0
  user.notes.create({
    title: Faker::Lorem.words(8).join(" ").capitalize,
    notebook_id: user.notebooks.sample.id,
    body: Faker::Lorem.paragraph(20)
  })
end

200.times do
  user = User.all.sample
  user.tags.create({
    name: Faker::Lorem.words(2).join(" ").capitalize
  })
end

300.times do
  user = User.all.sample
  next if (user.tags.length == 0) || (user.notes.length == 0)
  tag = user.tags.sample
  note = user.notes.sample
  next if note.tags.include?(tag)
  NoteTag.create({
    note_id: note.id,
    tag_id: tag.id
  })
end

200.times do
  user = User.all.sample
  note = Note.all.sample
  next if note.likers.include?(user)
  Like.create({
    owner_id: user.id,
    note_id: note.id
  })
end

500.times do
  user = User.all.sample
  note = Note.all.sample
  note.comments.create({
    author_id: user.id,
    body: Faker::Lorem.sentences(4).join(" ")
  })
end

100.times do
  friends = User.all.sample(2)
  in_friend = friends[0]
  out_friend = friends[1]
  next if in_friend.friends.include?(out_friend)
  in_friend.friendships.create({
    in_friend_id: out_friend.id
  })
  out_friend.friendships.create({
    in_friend_id: in_friend.id
  })
end