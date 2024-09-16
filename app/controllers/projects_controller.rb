class ProjectsController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!   
    before_action :set_project, only: [:show, :edit, :update, :destroy]


    layout  'home'
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
    
      @project = Project.new(project_params)
      
      respond_to do |format|
        if @project.save
          format.html{ redirect_to @project, notice: 'Project was successfully created. Now you can add tasks.'}
        else
          format.html{render :new }
          format.json {render json: @project.errors, status: :unprocessable_entity }
        end
       end
    end
  
    def edit
    end
  
    def update
      if @project.update(project_params)
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
    def project_params
      params.require(:project).permit(:name, :description )
    end
  end
  