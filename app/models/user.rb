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

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_random_token
  end
end