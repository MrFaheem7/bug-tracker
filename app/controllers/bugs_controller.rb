class BugsController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!

    before_action :set_project  
    before_action :set_bug, only: [:show, :edit, :update, :destroy]
    skip_before_action :set_project, only: [:my_tasks]
    layout  'home'
    def index
      @bugs = @project.bugs  
    end
  
    def show
    end
  
    def new
      @bug = @project.bugs.build  
      @developers = User.where(user_type: 'developer')  
    end
  
    def create
      @bug = @project.bugs.build(bug_params)
      @bug.creator = current_user  
      if @bug.save
        redirect_to project_bug_path(@project, @bug), notice: 'Task (bug/feature) was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @developers = User.where(user_type: 'developer') 
    end
  
    def update
      if @bug.update(bug_params)
        redirect_to project_bug_path(@project, @bug), notice: 'Task (bug/feature) was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @bug.destroy
      redirect_to project_bugs_path(@project), notice: 'Task (bug/feature) was successfully deleted.'
    end
    
    def my_tasks 
      @bugs = Bug.accessible_by(current_ability).where(developer_id: current_user.id)
    end
  
    private
  
    def set_project
      @project = Project.find(params[:project_id])  
    end
  
    def set_bug
      @bug = @project.bugs.find(params[:id]) 
    end
  
    def bug_params
      params.require(:bug).permit(:title, :description, :bug_type, :status, :deadline, :developer_id, :screenshot)
    end
end