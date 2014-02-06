class ProjectsController < ApplicationController
  def index
  end

  def create
    @schedule = Schedule.find(params[:schedule_id])
    @project = @schedule.projects.new(project_params)

    if @project.save
      render "show"
    end
  end
  
  def new
    @schedule = Schedule.find(params[:schedule_id])
    @project  = @schedule.projects.new
  end
  
  def show
    @schedule = Schedule.find(params[:schedule_id])
    @project = Project.find(params[:id])
  end

private
  def project_params
    params.require(:project).permit(:name, :start_date, :end_date, :schedule_id)
  end
end
