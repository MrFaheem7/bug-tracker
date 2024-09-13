class ProjectsController < ApplicationController
    before_action :authenticate_user!  
    # before_action :ensure_manager, only: [:new, :create, :edit, :update, :destroy]  
    before_action :set_project, only: [:show, :edit, :update, :destroy]
  
    def index
      @projects = Project.all
    end
  
    def show
      @bugs = @project.bugs  
    end
  
    def new
      @project = Project.new
    end
  
   
    def create
    debugger
      @project = Project.new(params.require(:project).permit(:name, :description))
      
      respond_to do |format|
        if @project.save
          format.html{ redirect_to @project, notice: 'Project was successfully created. Now you can add tasks.'}
        else
          format.html{render :new }
        end
       end
    end
  
    def edit
    end
  
    def update
      if @project.update(params.require(:project).permit(:name, :description))
        redirect_to @project, notice: 'Project was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @project.destroy
      redirect_to projects_url, notice: 'Project was successfully deleted.'
    end
  
    private
  
    def set_project
      @project = Project.find(params[:id])
    end
    # def ensure_manager
    #   unless current_user.manager?
    #     redirect_to projects_path, alert: 'Only managers can create or edit projects.'
    #   end
    # end
  end
  