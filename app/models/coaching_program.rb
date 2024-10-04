# frozen_string_literal: true

class CoachingProgram < ApplicationRecord
  belongs_to :company
  has_and_belongs_to_many :coaches

  validates :name, presence: true, uniqueness: { scope: :company_id }, length: { maximum: 150 }
  validates :description, length: { maximum: 500 }, allow_blank: true
end
