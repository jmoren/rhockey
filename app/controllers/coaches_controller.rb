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
  
  def edit
    @coach = Coach.find(params[:id])
    if @coach.photo
      @photo = @coach.photo
    else
      @photo = @coach.build_photo
    end
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
      @team.coaches.reload
      flash[:notice] = "Successfully destroyed player."
      respond_to do |format|
        format.js
      end
    end
  end
end
