class ProjectsController < ApplicationController
    before_action :authenticate_user!
    def index
        @projects = Project.page(params[:page]).per(9)
    end
end
