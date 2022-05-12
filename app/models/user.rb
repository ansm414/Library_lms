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
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  # validates :name, presence: true
  # validates :email, presence: true
  # validates :address, presence: true
  # validates :gender, presence: true
  # validates :role_id, presence: true
  def self.from_omniauth(access_token)
    binding.pry
    data = access_token.info
    
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
  
    unless user
        user = User.create(
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end

  validates :name, :email, :address, :gender, :role_id, presence: true
end

