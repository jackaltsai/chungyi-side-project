class Admin::ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin

    before_action :set_project, only: [:show, :edit, :update, :destroy]
    def index
        @projects = Project.all
    end

    def new
        @Project = Project.new
    end

    def create
        @project = Project.new(project_params)
        if @project.save
          flash[:notice] = "project was successfully created"
          redirect_to admin_projects_path
        else
          flash.now[:alert] = "project was failed to create"
          render :new
        end
    end

    def update
        if @project.update(project_params)
          flash[:notice] = "project was successfully updated"
          redirect_to admin_project_path(@project)
        else
          flash.now[:alert] = "project was failed to update"
          render :edit
        end
      end

    def show      
    end

    def edit     
    end
    
    def destroy
        @project.destroy
        redirect_to admin_projects_path
        flash[:alert] = "project was deleted"
    end

    private
    
    def project_params
        params.require(:project).permit(:name, :description)
    end

    def set_project
        @project = Project.find(params[:id])
    end
end
