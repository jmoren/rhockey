class PlayersController < ApplicationController

  def index
    if params[:team_id]
      @team = Team.find_by_name(params[:team_id])
      @players = @team.players
    else
      @jugadores = Player.jugadores
      @arqueros = Player.arqueros
    end
  end
  
  def show
    @player = Player.find(params[:id])
    @team = @player.team
    @categorias = Category.where("minage <= ? && topage >= ?",@player.edad,@player.edad)
  end
  def new
    @team = Team.find_by_name(params[:team_id])
    @player = @team.players.build
  end

  def create
    @player = Player.new(params[:player])
    @player.email ||= "example@example.com"
    @team = @player.team
    if @player.save
      @team.players.reload
      flash[:notice] = "Successfully created player."
    else
      render :action => 'new'
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
    @team = @player.team
    if @player.destroy
      @team.players.reload
      flash[:notice] = "Successfully destroyed player."
      respond_to do |format|
        format.js
      end
    end
  end
end
