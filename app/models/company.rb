class Company < ApplicationRecord
  has_many :coaching_programs
  has_and_belongs_to_many :coaches
  has_many :employees

  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :zip, presence: true, numericality: { only_integer: true }, length: { is: 5 }
  validates :city, :state, :address, :country, presence: true
  validates :website, format: { with: URI::regexp(%w[http https]) }, allow_blank: true
end
