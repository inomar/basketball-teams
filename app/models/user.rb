class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
    user = User.where(provider: auth.provider, uuid: auth.uid).first
    unless user
      user = User.create(
          name:  auth.extra.raw_info.name,
          provider: auth.provider,
          uuid: auth.uid,
          email: auth.info.email,
          password: Devise.friendly_token[0,20]
      )
    end
    user
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource = nil)
    user = User.where(provider: auth.provider, uuid: auth.uid).first
    unless user
      user = User.create(
          name:     auth.info.nickname,
          provider: auth.provider,
          uuid:      auth.uid,
          email:    User.create_unique_email,
          password: Devise.friendly_token[0,20]
      )
    end
    user
  end

  # user作成時にランダム値をuuidとして設定
  def self.create_unique_string
    SecureRandom.uuid
  end

  # twitterではemailを取得できないので、適当に一意のemailを生成
  def self.create_unique_email
    User.create_unique_string + "@example.com"
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end
end
