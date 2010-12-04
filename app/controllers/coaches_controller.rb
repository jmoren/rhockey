class CoachesController < ApplicationController
  def index
    @coaches = Coach.all
  end
  
  def show
    @coach = Coach.find(params[:id])
  end
  
  def new
    @coach = Coach.new
    @photo = @coach.build_photo
  end
  
  def create
    @coach = Coach.new(params[:coach])
    @photo = @coach.build_photo
    if @coach.save
      flash[:notice] = "Successfully created coach."
      redirect_to @coach
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
    @coach.destroy
    flash[:notice] = "Successfully destroyed coach."
    redirect_to coaches_url
  end
  def check_email
    email = params[:coach][:email]
    @coach = Coach.find_by_email(email)
    respond_to do |format|
      format.json { render :json => !@coach }
    end
  end

end
