class CoachesController < ApplicationController
  def index
    @coaches = Coach.all
  end
  
  def show
    @coach = Coach.find(params[:id])
  end
  
  def new
    @coach = Coach.new
  end
  
  def create
    @coach = Coach.new(params[:coach])
    if @coach.save
      flash[:notice] = "Successfully created coach."
      redirect_to @coach
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
    @coach.destroy
    flash[:notice] = "Successfully destroyed coach."
    redirect_to coaches_url
  end
end
