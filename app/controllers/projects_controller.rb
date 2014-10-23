class ProjectsController < ApplicationController

	before_action :authenticate_user!, only: [:index]
	before_action :set_project, only: [:show, :update, :destroy]

  def index
  	@projects = current_user.projects
  end

  def show

  end

  def create
  	@project = Project.create(title: "New Project", user_id: current_user.id)
  	redirect_to @project, notice: "Project created"
  end

  def update
  	if @project.update(params.require(:project).permit(:title))
  		respond_to do |format|
		      format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
		      format.json { respond_with_bip(@project) }
		  end
	else
		respond_to do|format|
		    format.html { redirect_to :back, notice: "Something went wrong" }
		    format.json { respond_with_bip(@project) }
		end
    end
  end

  def destroy
  end

  private

  def set_project
  	@project = Project.find(params[:id])
  end

end
