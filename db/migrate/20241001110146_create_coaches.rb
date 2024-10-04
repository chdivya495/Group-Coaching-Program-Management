# frozen_string_literal: true

class CreateCoaches < ActiveRecord::Migration[7.1]
  def change
    create_table :coaches do |t|
      t.string :first_name
      t.string :last_name
      t.string :image
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
