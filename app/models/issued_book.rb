class IssuedBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_one :due_amount, dependent: :destroy
end
