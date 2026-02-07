class ProjectsController < ApplicationController

    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        if @project.save #is this a valid project?
            flash[:notice] = "Project was created successfully!" #set a flash message to show on the next page
            redirect_to project_path(@project) #redirect to show page for this new project
        else
            render :new , status: :unprocessable_entity #if not valid, re-render the new form with error messages
        end 
    end


    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id]);
        if @project.update(project_params)
            flash[:notice] = "Project was updated successfully!"
            redirect_to project_path(@project)
        else
            render :edit , status: :unprocessable_entity
        end
    end


    def project_params
        params.expect(project: [:name])
    end


    def destroy
        @project = Project.find(params[:id])
        @project.destroy 
        flash[:notice] = "Project was deleted successfully!";
        redirect_to projects_path
    end
    
end
