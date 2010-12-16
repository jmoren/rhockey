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
    @teams = Team.where(:category_id => @championship.category_id)
  end
  
  def create
    @championship = Championship.find(params[:championship_id])
    @game = @championship.games.build(params[:game])
    #Add teams
    if params[:local] && params[:visitor]
      @local = @game.rivals.build(:team_id => params[:local], :local => true)
      @visitor = @game.rivals.build(:team_id => params[:visitor], :local => false)
      @game.rivals << [@local, @visitor]
      if @game.save
        flash[:notice] = "Successfully created game."
        redirect_to championship_path(@championship)
      else
        @teams = Team.where(:category_id => @championship.category_id)
        render :action => 'new'
      end
    else
      flash[:error] = "Debe seleccionar dos equipos diferentes"
      render :action => 'new'
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
