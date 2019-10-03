class ProjectsController < ApplicationController
  before_action :authenticate_admin!, except: :show

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project created"
      redirect_to @project
    else
      flash.now[:danger] = "Invalid project details"
      render :new
    end
  end

  def show
    @project = Project.friendly.find(params[:id])
  end

  def edit
    @project = Project.friendly.find(params[:id])
  end

  def update
    @project = Project.friendly.find(params[:id])
    if @project.update(project_params)
      flash[:success] = "Project updated"
      redirect_to @project
    else
      flash.now[:danger] = "Invalid project details"
      render :edit
    end
  end

  def destroy
    @project = Project.friendly.find(params[:id])
    @prohect.destroy
    flash[:info] = "Project deleted"
    redirect_to root_path(anchor: "projects")
  end

  private

    def project_params
      params.require(:project).permit(:title, :description, :url,
                                      :source, :image, :more)
    end
end
