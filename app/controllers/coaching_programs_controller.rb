# frozen_string_literal: true

class CoachingProgramsController < ApplicationController
  def coaches
    coaching_program = CoachingProgram.find(params[:id])
    coaches = coaching_program.coaches
    render json: coaches
  end
end
