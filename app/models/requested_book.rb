class RequestedBook < ApplicationRecord
  paginates_per 4
  belongs_to :user
  belongs_to :book
  enum status: %i[pending approved rejected], _default: "pending"

  scope :pending_status, -> { where(:status => "pending")}
  scope :rejected_status, -> { where(:status => "rejected")}  
end