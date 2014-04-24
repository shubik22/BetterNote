User.create({
  username: "John",
  email: "john@beatles.com",
  password: "password"
})

User.create({
  username: "Paul",
  email: "paul@beatles.com",
  password: "password"
})

User.create({
  username: "George",
  email: "george@beatles.com",
  password: "password"
})

User.create({
  username: "Ringo",
  email: "ringo@beatles.com",
  password: "password"
})

Notebook.create({
  name: "Help!",
  owner_id: 1
})

Notebook.create({
  name: "Meet the Beatles!",
  owner_id: 2
})

Notebook.create({
  name: "A Hard Day's Night",
  owner_id: 2
})

Note.create({
  title: "I Want to Hold Your Hand",
  author_id: 2,
  notebook_id: 2,
  body: <<-LYRICS
    Oh please, say to me
    You'll let me be your man.
    And please, say to me
    You'll let me hold your hand
    I'll let me hold your hand
    I wanna hold your hand
  LYRICS
})

Note.create({
  title: "A Hard Day's Night",
  author_id: 2,
  notebook_id: 3,
  body: <<-LYRICS
    When I'm home everything seems to be right
    When I'm home feeling you holding me tight, tight, yeah
    It's been a hard day's night, and I'd been working like a dog
    It's been a hard day's night, I should be sleeping like a log
    But when I get home to you I find the things that you do
    Will make me feel alright owww
  LYRICS
})

Note.create({
  title: "Can't Buy Me Love",
  author_id: 2,
  notebook_id: 3,
  body: <<-LYRICS
    I'll buy you a diamond ring my friend
    If it makes you feel all right
    I'll get you anything my friend
    If it makes you feel all right
    'Cause I don't care too much for money
    For money can't buy me love
  LYRICS
})

Note.create({
  title: "It's Only Love",
  author_id: 1,
  notebook_id: 1,
  body: <<-LYRICS
    I get high when I see you go by
    My oh my
    When you sigh, my, my inside just flies
    Butterflies
    Why am I so shy when I'm beside you?
    It's only love and that is all
  LYRICS
})

Note.create({
  title: "You're Going To Lose That Girl",
  author_id: 1,
  notebook_id: 1,
  body: <<-LYRICS
    If you don't take her out tonight
    She's going to change her mind
    And I will take her out tonight
    And I will treat her kind
    You're going to lose that girl
    You're going to lose that girl
  LYRICS
})

Tag.create({
  name: "Love Songs",
  owner_id: 1
})

Tag.create({
  name: "Favorite Songs",
  owner_id: 1
})

Tag.create({
  name: "Written with John",
  owner_id: 2
})

NoteTag.create({
  tag_id: 1,
  note_id: 4
})

NoteTag.create({
  tag_id: 1,
  note_id: 5
})

NoteTag.create({
  tag_id: 2,
  note_id: 4
})

NoteTag.create({
  tag_id: 3,
  note_id: 1
})

NoteTag.create({
  tag_id: 3,
  note_id: 2
})

Like.create({
  note_id: 1,
  owner_id: 1
})

Like.create({
  note_id: 5,
  owner_id: 1
})

Comment.create({
  body: "Great song!  Clearly written with a talented cowriter.",
  author_id: 1,
  note_id: 1
})

Friendship.create({
  in_friend_id: 1,
  out_friend_id: 2
})

Friendship.create({
  in_friend_id: 2,
  out_friend_id: 1
})

FriendRequest.create({
  in_friend_id: 1,
  out_friend_id: 3
})

Notification.create({
  user_id: 2,
  notifiable_type: "comment",
  notifiable_id: 1
})

Notification.create({
  user_id: 2,
  notifiable_type: "like",
  notifiable_id: 2
})

Notification.create({
  user_id: 2,
  notifiable_type: "friendship",
  notifiable_id: 1
})