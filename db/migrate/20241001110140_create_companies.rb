# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.integer :zip
      t.string :city
      t.string :state
      t.string :address
      t.string :country
      t.string :website
      t.string :logo

      t.timestamps
    end
  end
end
