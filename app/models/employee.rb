# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :company
  belongs_to :coaching_program
  belongs_to :coach, optional: true

  validates :first_name, :last_name, presence: true, length: { maximum: 100 }
  validates :phone, format: { with: %r{\A[0-9+()#.\s/ext-]+\z} }, allow_blank: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :department, length: { maximum: 100 }, allow_blank: true
end
