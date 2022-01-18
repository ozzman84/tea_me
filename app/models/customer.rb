# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :subscriptions

  validates :email, uniqueness: { case_sensative: false }
  validates_presence_of :first_name, :last_name, :email, :address
end
