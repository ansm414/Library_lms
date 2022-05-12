class Category < ApplicationRecord
    paginates_per 4
    has_many :books, dependent: :destroy
    validates :name, presence: true
end
