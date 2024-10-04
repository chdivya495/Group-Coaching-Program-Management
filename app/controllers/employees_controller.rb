# frozen_string_literal: true

class EmployeesController < ApplicationController
  def new
    @company = Company.find_by(id: params[:company_id])
    @employee = Employee.new
    @coaching_programs = @company.coaching_programs
  end

  def create
    @company = Company.find(params[:company_id])
    @employee = @company.employees.new(employee_params)

    if @employee.save
      redirect_to company_employee_path(@company, @employee), notice: 'Employee was successfully created.'
    else
      render :new
    end
  end

  def show
    @employee = Employee.find(params[:id])
  end

  private

  def employee_params
    params.require(:employee).permit(:coaching_program_id, :coach_id, :first_name, :last_name, :email, :phone,
                                     :department, :coaching_requirements)
  end
end
