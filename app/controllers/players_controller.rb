class PlayersController < ApplicationController
  before_filter :set_team

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
    if @player.recategorizar?
      @categorias = Category.where("minage <= ? and topage >= ?", @player.edad, @player.edad)
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
  def set_team
    if params[:team_id]
      @team = Team.find_by_name(params[:team_id])
    end
  end
end
