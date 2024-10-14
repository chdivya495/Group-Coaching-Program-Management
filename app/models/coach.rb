# frozen_string_literal: true

class Coach < ApplicationRecord
  has_and_belongs_to_many :coaching_programs
  has_and_belongs_to_many :companies
  has_many :employees

  validates :first_name, presence: true, length: { maximum: 100 }
  validates :last_name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
