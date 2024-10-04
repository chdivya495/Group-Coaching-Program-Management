# frozen_string_literal: true

class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @coaching_programs = CoachingProgram.where(company_id: @company.id)
    @coaches = Coach.all
  end
end
