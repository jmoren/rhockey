class PlayersController < ApplicationController
  def index
    @players = Player.all
  end
  
  def show
    @player = Player.find(params[:id])
    @team = @player.team
  end
  
  def new
    @player = Player.new
    @photo = @player.build_photo
  end
  
  def create
    @player = Player.new(params[:player])
    @photo = @player.build_photo
    if @player.save
      flash[:notice] = "Successfully created player."
      redirect_to @player
    else
      render :action => 'new'
    end
  end
  
  def edit
    @player = Player.find(params[:id])
    if @player.photo
      @photo = @player.photo
    else
      @photo = @player.build_photo
    end
  end
  
  def update
    @player = Player.find(params[:id])
    @photo = @player.photo
    if @player.update_attributes(params[:player])
      flash[:notice] = "Successfully updated player."
      redirect_to @player
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    flash[:notice] = "Successfully destroyed player."
    redirect_to players_url
  end
  def check_email
    email = params[:player][:email]
    @player = Player.find_by_email(email)
    respond_to do |format|
      format.json { render :json => !@player }
    end
  end

end
