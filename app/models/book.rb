class Book < ApplicationRecord
  paginates_per 3
  has_one_attached :book_image
  belongs_to :category
  has_many :ratings, dependent: :destroy
  has_many :requested_books, dependent: :destroy
  has_many :users, through: :requested_books, dependent: :destroy
  has_many :issued_books, dependent: :destroy
  has_many :users, through: :issued_books, dependent: :destroy
  validates :name, :author, :description, :category_id, :book_image, presence: true

  scope :available_books, -> { where(:available => true)}
  scope :unavailable_books, -> { where(:available => false)}

  

end
