class User < ApplicationRecord
  has_many :messages
  NAME_REGEX = /\w+/
  validates :username, presence: true,
    uniqueness: { case_sensitive: false }

  def self.from_omniauth(auth)
    if pre_existing_user = User.find_by_email(auth.info.email)
      pre_existing_user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.username = User.random_username
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
      end
    end
  end

  private

  def self.random_username
    name = Fffaker.random_username
    while User.find_by_username(name)
      name = Fffaker.random_username
    end
    name
  end
end
