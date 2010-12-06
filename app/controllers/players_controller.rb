class PlayersController < ApplicationController

  def index
    @players = Player.all
  end
  
  def show
    @player = Player.find(params[:id])
    @team = @player.team
    if @player.recategorizar?
      @categorias = Category.where("minage <= ? and topage >= ?", @player.edad, @player.edad)
    end
  end
  
  def new
    @player = Player.new
  end
  
  def create
    @player = Player.new(params[:player])
    if @player.save
      @team = @player.team.reload
      flash[:notice] = "Successfully created player."
      #respond_to do |format|
      #  format.js
      #end
    #else
      #render :action => 'new'
    end
  end
  
  def edit
    @player = Player.find(params[:id])
  end
  
  def update
    @player = Player.find(params[:id])
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
    redirect_to :back
  end
  def check_email
    email = params[:player][:email]
    @player = Player.find_by_email(email)
    respond_to do |format|
      format.json { render :json => !@player }
    end
  end

end
