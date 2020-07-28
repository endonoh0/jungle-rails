class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :product

  validates :rating, :description, presence: true
end
