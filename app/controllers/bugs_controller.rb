class BugsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project  # Ensure we're working within a specific project
    before_action :set_bug, only: [:show, :edit, :update, :destroy]
  
    def index
      @bugs = @project.bugs  # Show all bugs for the project
    end
  
    def show
    end
  
    def new
      @bug = @project.bugs.build  # Build a new bug associated with the project
      @developers = User.where(user_type: 'developer')  # Only developers can be assigned
    end
  
    def create
      @bug = @project.bugs.build(bug_params)
      @bug.creator = current_user  # Assign the current user (manager) as the creator
      if @bug.save
        redirect_to project_bug_path(@project, @bug), notice: 'Task (bug/feature) was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @developers = User.where(user_type: 'developer')  # Only developers can be assigned
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
  
    private
  
    def set_project
      @project = Project.find(params[:project_id])  # Find the project by its ID
    end
  
    def set_bug
      @bug = @project.bugs.find(params[:id])  # Find the bug by its ID within the project
    end
  
    def bug_params
      params.require(:bug).permit(:title, :description, :bug_type, :status, :deadline, :developer_id)
    end
end