class GamesController < ApplicationController
  def index
    @games = Game.all
  end
  
  def show
    @game = Game.find(params[:id])
    @local = @game.local
    @visitor = @game.visitor
  end
  
  def new
    @championship = Championship.find(params[:championship_id])
    @game = @championship.games.build
    @photo = @game.build_photo
    @local = @game.build_local
    @visitor = @game.build_visitor
    @teams = Team.where(:category_id => @championship.category_id)
  end
  
  def create
    @championship = Championship.find(params[:championship_id])
    @game = @championship.games.build(params[:game])
    unless params[:local].blank? && params[:visitor].blank?
      @local = @game.rivals.build(:team_id => params[:local], :local => true)
      @visitor = @game.rivals.build(:team_id => params[:visitor], :local => false)
      if @game.save
        flash[:notice] = "Successfully created game."
        redirect_to championship_game_path(@championship,@game)
      else
        render new_championship_game_path(@championship)
      end
    else
      flash[:error] = "You need select two teams"
      render new_championship_game_path(@championship)
    end
  end
  def edit
    @game = Game.find(params[:id])
  end
  
  def update
    @game = Game.find(params[:id])
    if @game.update_attributes(params[:game])
      flash[:notice] = "Successfully updated game."
      redirect_to @game
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    flash[:notice] = "Successfully destroyed game."
    redirect_to games_url
  end
end
