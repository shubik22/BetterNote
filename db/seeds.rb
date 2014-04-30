User.create({
  username: "Jon Bon Jovi",
  email: "jbj@betternote.com",
  password: "password"
})

jbj = User.all.first

10.times do
  jbj.notebooks.create({
    name: Faker::Lorem.words(4).join(" ").capitalize
  })
end

100.times do
  jbj.notes.create({
    title: Faker::Lorem.words(8).join(" ").capitalize,
    notebook_id: jbj.notebooks.sample.id,
    body: Faker::Lorem.paragraph(20)
  })
end

20.times do
  User.create({
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: "password"
  })
end

100.times do
  user = User.all.sample
  next if user.notebooks.length == 0
  user.notes.create({
    title: Faker::Lorem.words(8).join(" ").capitalize,
    notebook_id: user.notebooks.sample.id,
    body: Faker::Lorem.paragraph(20)
  })
end

10.times do
  jbj = User.find(1)
  jbj.tags.create({
    name: Faker::Lorem.words(2).join(" ").capitalize
  })
end

200.times do
  tag = jbj.tags.sample
  note = jbj.notes.sample
  NoteTag.create({
    note_id: note.id,
    tag_id: tag.id
  })
end

200.times do
  user = User.all.sample
  note = jbj.notes.sample
  next if note.likers.include?(user)
  Like.create({
    owner_id: user.id,
    note_id: note.id
  })
end

500.times do
  user = User.all.sample
  note = jbj.notes.sample
  note.comments.create({
    author_id: user.id,
    body: Faker::Lorem.sentences(4).join(" ")
  })
end

10.times do
  out_friend = User.all.sample
  next if jbj.friends.include?(out_friend)
  jbj.friendships.create({
    in_friend_id: out_friend.id
  })
  out_friend.friendships.create({
    in_friend_id: jbj.id
  })
end