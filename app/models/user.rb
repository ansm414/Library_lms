class User < ApplicationRecord
  has_one_attached :user_image
  belongs_to :role
  has_many :requested_books
  has_many :ratings
  has_many :books, through: :requested_books
  has_many :issued_books
  has_many :books, through: :issued_books
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :github]
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    unless user
        user = User.create(
          name: data['name'] || data['nickname'],
          email: data['email'],
          role_id: Role.last.id,
          gender: "Male",
          address: 'update your address',
          password: Devise.friendly_token[0,20]
        )
    end
    user
  end

  validates :name, :email, :address, :gender, :role_id, presence: true
  
end

