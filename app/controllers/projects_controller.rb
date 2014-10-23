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
  end

  def destroy
  end

  private

  def set_project
  	@project = Project.find(params[:id])
  end

end
