class DueAmount < ApplicationRecord
  belongs_to :issued_book

  scope :paid_fines, -> { where(:paid => true)}
  scope :unpaid_fines, -> { where(:paid => false)}
  scope :user_paid_fines, ->(user_id) {joins(:issued_book).where("issued_books.user_id = ?",  user_id)}
  scope :user_unpaid_fines, ->(user_id) {joins(:issued_book).where("issued_books.user_id = ?",  user_id)}

  # Ex:- scope :active, -> {where(:active => true)}

end
