# frozen_string_literal: true

class AddCoachToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_reference :employees, :coach, foreign_key: true
  end
end
