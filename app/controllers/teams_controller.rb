class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end
  
  def show
    @team = Team.find_by_name(params[:id])
  end
  
  def new
    @team = Team.new
    @team.photo = Photo.create
  end
  
  def create
    @team = Team.new(params[:team])
    @photo = @team.build_photo
    if @team.save
      flash[:notice] = "Successfully created team."
      redirect_to @team
    else
      render :action => 'new'
    end
  end
  
  def edit
    @team = Team.find_by_name(params[:id])
    @photo = @team.photo
  end
  
  def update
    @team = Team.find_by_name(params[:id])
    if @team.update_attributes(params[:team])
      flash[:notice] = "Successfully updated team."
      redirect_to @team
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @team = Team.find_by_name(params[:id])
    @team.destroy
    flash[:notice] = "Successfully destroyed team."
    redirect_to teams_url
  end
end
