class TeamCoachesController < ApplicationController
  def new
    @team = Team.find_by_name(params[:team_id])
    @coach = @team.coaches.build
  end
  
  def create
    @coach = Coach.new(params[:coach])
    @coach.email ||= "example@example.com"
    @team = @coach.team
    if @coach.save
      @team.coaches.reload
      flash[:notice] = "Successfully created coach."
    else
      render :action => 'new'
    end
  end

  
end
