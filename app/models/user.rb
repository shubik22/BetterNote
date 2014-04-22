class User < ActiveRecord::Base
  attr_reader :password
  validates :username, :email, :password_digest, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :session_token, presence: true
  before_validation :ensure_session_token

  has_many(
    :notes,
    foreign_key: :author_id,
    inverse_of: :author,
    dependent: :destroy
  )

  has_many(
    :notebooks,
    foreign_key: :owner_id,
    inverse_of: :owner,
    dependent: :destroy
  )

  has_many(
    :tags,
    foreign_key: :owner_id,
    inverse_of: :owner,
    dependent: :destroy
  )

  has_many(
    :comments,
    foreign_key: :author_id,
    inverse_of: :author,
    dependent: :destroy
  )

  has_many(
    :likes,
    foreign_key: :owner_id,
    inverse_of: :owner,
    dependent: :destroy
  )

  has_many(
    :friendships,
    foreign_key: :out_friend_id,
    inverse_of: :out_friend,
    dependent: :destroy
  )

  has_many :friends, through: :friendships, source: :in_friend

  has_many(
    :friend_requests,
    foreign_key: :out_friend_id,
    inverse_of: :out_friend,
    dependent: :destroy
  )

  has_many :notifications, inverse_of: :user, dependent: :destroy

  has_many :pending_friends, through: :friend_requests, source: :in_friend

  def self.generate_random_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password) if password
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_random_token
    self.save!
    self.session_token
  end

  def friend?(other_user)
    self.friends.include?(other_user)
  end

  def pending_friend?(other_user)
    self.pending_friends.include?(other_user)
  end

  def find_friend_request(other_user)
    self.friend_requests.where({in_friend: other_user}).first
  end

  def find_friendship(other_user)
    self.friendships.where({in_friend: other_user}).first
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_random_token
  end
end