class User < ApplicationRecord
  has_one_attached :image

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :omniauthable ,omniauth_providers: [:facebook, :google_oauth2]

  
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :image
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}, allow_nil: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: {with:/\A[ァ-ヶ]+\z/} do
    validates :first_name_katakana
    validates :last_name_katakana
  end

  has_many :celebs, through: :rooms
  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one :card, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
