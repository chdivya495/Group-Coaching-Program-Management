# frozen_string_literal: true

class AddCoachingProgramToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_reference :employees, :coaching_program, null: false, foreign_key: true
  end
end
