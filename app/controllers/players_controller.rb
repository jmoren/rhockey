class PlayersController < ApplicationController
  can_edit_on_the_spot 
  def index
    @jugadores = Player.jugadores
    @arqueros = Player.arqueros
  end
  
  def show
    @player = Player.find(params[:id])
    @team = @player.team
    @categorias = Category.where("minage <= ? and topage >= ?",@player.edad,@player.edad)
  end
  def new
    @team = Team.find_by_name(params[:team_id])
    @player = @team.players.build
  end

  def create
    @team = Team.find_by_name(params[:team_id])
    @player = @team.players.build(params[:player])
    @player.email ||= "example@example.com"
    @team = @player.team
    if @player.save
      flash[:notice] = "Successfully created player..."
      redirect_to team_path(@team)
    else
      flash[:error] = "Se encontraron algunos errores"
       redirect_to team_path(@team)
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
      flash[:notice] = "Error..."
      render :action => 'edit'
    end
  end
  
  def destroy
    @player = Player.find(params[:id])
    @team = @player.team
    if @player.destroy
      flash[:notice] = "Successfully destroyed player."
      redirect_to team_path(@team)
    end
  end
end
