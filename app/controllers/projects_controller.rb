class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @categories = Category.all.order("id ASC").limit(17)
  end

  def create
    Project.create(project_params)
    redirect_to root_path
  end

  def show
    @project = Project.find(params[:id])
    @category = Category.find(@project.category_id)
  end

  def contract
    @project = Project.find(params[:id])
    if @project.contractor_id || @project.user == current_user
      redirect_to root_path
    else
      @project.contractor_id = current_user.id
      @project.save
      # redirect_to root_path
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :price, :user_id, :category_id).merge(user_id: current_user.id)
  end
end
