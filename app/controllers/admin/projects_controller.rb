class Admin::ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin
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
    
      private
    
      def project_params
        params.require(:project).permit(:name, :description)
      end
end
