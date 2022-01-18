# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :customer
  enum status: %w[active cancelled]
  enum frequency: %w[weekly monthly annually]

  validates :title, :price, :status, :frequency, presence: true
  validates :price, numericality: { greater_than: 0 }
end
