# frozen_string_literal: true

class CreateJoinTableCompaniesCoaches < ActiveRecord::Migration[7.1]
  def change
    create_join_table :companies, :coaches do |t|
      t.index %i[company_id coach_id]
      t.index %i[coach_id company_id]
    end
  end
end
