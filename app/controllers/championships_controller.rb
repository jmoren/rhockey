class ChampionshipsController < ApplicationController
  before_filter :check_dates, :only => [:show]
  def index
    @championships = Championship.open
    @champ_closed = Championship.closed
  end
  
  def show
    @championship = Championship.find(params[:id])
    @games = @championship.games
  end
  
  def new
    @championship = Championship.new
  end
  
  def create
    @championship = Championship.new(params[:championship])
    if @championship.save
      flash[:notice] = "Successfully created championship."
      redirect_to @championship
    else
      render :action => 'new'
    end
  end
  
  def edit
    @championship = Championship.find(params[:id])
  end
  
  def update
    @championship = Championship.find(params[:id])
    if @championship.update_attributes(params[:championship])
      flash[:notice] = "Successfully updated championship."
      redirect_to @championship
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @championship = Championship.find(params[:id])
    @championship.destroy
    flash[:notice] = "Successfully destroyed championship."
    redirect_to championships_path
  end
  def check_dates
    @championship = Championship.find(params[:id])
    @championship.closed?
  end
end
