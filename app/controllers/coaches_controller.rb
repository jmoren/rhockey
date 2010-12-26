class CoachesController < ApplicationController
  def index
    @coaches = Coach.all
  end
  
  def show
    @coach = Coach.find(params[:id])
  end

  def new
    @team = Team.find_by_name(params[:team_id])
    @coach = @team.coaches.build
  end

  def create
    @team = Team.find_by_name(params[:team_id])
    @coach = @team.coaches.build(params[:coach])
    @coach.email ||= "example@example.com"
    @team = @coach.team
    if @coach.save
      flash[:notice] = "Successfully created coach."
      redirect_to team_path(@team)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @coach = Coach.find(params[:id])
  end
  
  def update
    @coach = Coach.find(params[:id])
    if @coach.update_attributes(params[:coach])
      flash[:notice] = "Successfully updated coach."
      redirect_to @coach
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @coach = Coach.find(params[:id])
    @team = @coach.team
    if @coach.destroy
      flash[:notice] = "Successfully destroyed player."
      redirect_to team_path(@team)
    end
  end
end
