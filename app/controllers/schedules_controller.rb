class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      render "show"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

private

  def schedule_params
    params.require(:schedule).permit(:name)
  end 
end
