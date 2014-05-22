task :reset_database => :environment do
  models = [User, Note, Notebook, Tag, Comment, Like, NoteTag,
    Friendship, FriendRequest, Notification]
  models.each { |model| model.delete_all }
  Rails.application.load_seed
end