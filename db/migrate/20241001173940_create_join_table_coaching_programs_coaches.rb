# frozen_string_literal: true

class CreateJoinTableCoachingProgramsCoaches < ActiveRecord::Migration[7.1]
  def change
    create_join_table :coaching_programs, :coaches do |t|
      t.index %i[coaching_program_id coach_id]
      t.index %i[coach_id coaching_program_id]
    end
  end
end
