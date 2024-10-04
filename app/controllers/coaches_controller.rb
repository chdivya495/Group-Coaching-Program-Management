# frozen_string_literal: true

class CoachesController < ApplicationController
  def index
    @coaches = Coach.joins(:coaching_programs)
                    .left_joins(:employees, :companies)
                    .distinct

    if params[:coaching_program_name].present?
      @coaches = @coaches.where('coaching_programs.name LIKE ?', "%#{params[:coaching_program_name]}%")
    end

    return unless params[:company_name].present?

    @coaches = @coaches.where('companies.name LIKE ?', "%#{params[:company_name]}%")
  end

  def dashboard
    @coaches = Coach.all

    if params[:coach_id].present?
      @selected_coach = Coach.includes(:employees, :coaching_programs, :companies).find(params[:coach_id])
      @employees = @selected_coach.employees
      @student_count = @employees.count
      @coaching_programs = @selected_coach.coaching_programs
      @companies = @selected_coach.companies
    else
      @selected_coach = nil
      @employees = []
      @student_count = 0
      @coaching_programs = []
      @companies = []
    end
  end

  def get_coach_details
    if params[:coach_id].present?
      @selected_coach = Coach.includes(:employees, :coaching_programs, :companies).find(params[:coach_id])
      @employees = @selected_coach.employees
      @coaching_programs = @selected_coach.coaching_programs
      @companies = @selected_coach.companies
      render json: { coach: @selected_coach, employees: @employees, coaching_programs: @coaching_programs,
                     companies: @companies }
    else
      render json: { error: 'Coach not found' }, status: :not_found
    end
  end

  def show
    @selected_coach = Coach.includes(:employees, :coaching_programs, :companies).find(params[:id]) # Use params[:id] for the show route
    @coaching_programs = @selected_coach.coaching_programs
    @employees = @selected_coach.employees
    @companies = @selected_coach.companies # Access the companies directly
    @student_count = @employees.count
  end
end
