FactoryGirl.define do
  factory :user do
    email { Faker::Internet.safe_email }
    username { Faker::Internet.user_name }
    password { Faker::Internet.password }
  end

  factory :note do
    title { Faker::Lorem.sentence(3) }
    body { Faker::Lorem.paragraph }
    author_id { Faker::Number.digit }
    notebook_id { Faker::Number.digit }
  end

  factory :notebook do
    name { Faker::Lorem.sentence(5) }
    owner_id { Faker::Number.digit }
  end

  factory :tag do
    name { Faker::Lorem.sentence(2) }
    owner_id { Faker::Number.digit }
  end

  factory :note_tag do
    note_id { Faker::Number.digit }
    tag_id { Faker::Number.digit }
  end

  factory :comment do
    author_id { Faker::Number.digit }
    note_id { Faker::Number.digit }
  end

  factory :like do
    note_id { Faker::Number.digit }
    owner_id { Faker::Number.digit }
  end

  factory :friendship do
    in_friend_id { Faker::Number.digit }
    out_friend_id { Faker::Number.digit }
  end

  factory :friend_request do
    in_friend_id { Faker::Number.digit }
    out_friend_id { Faker::Number.digit }
  end

  factory :notification do
    user_id { Faker::Number.digit }
    notifiable_id { Faker::Number.digit }
    notifiable_type { Faker::Lorem.sentence(1) }
  end
end