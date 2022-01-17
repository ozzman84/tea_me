class Subscription < ApplicationRecord
  belongs_to :customer
  enum status: %w[active cancelled]
  enum frequency: %w[weekly monthly annually]

  validates_presence_of :title, :price, :status, :frequency
  validates_numericality_of :price
end
