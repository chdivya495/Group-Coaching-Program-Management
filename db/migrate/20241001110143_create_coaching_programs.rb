# frozen_string_literal: true

class CreateCoachingPrograms < ActiveRecord::Migration[7.1]
  def change
    create_table :coaching_programs do |t|
      t.string :name
      t.text :description
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
