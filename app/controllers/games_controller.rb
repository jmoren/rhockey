class GamesController < ApplicationController
  def index
    @games = Game.all
  end
  
  def show
    @game = Game.find(params[:id])
    @local = @game.local
    @visitor = @game.visitor
    if @game.finished? 
      @gunner = @game.set_gunner 
      @dirty_player = @game.set_dirty_player 
    end
  end
  
  def new
    @championship = Championship.find(params[:championship_id])
    @game = @championship.games.build
    @photo = @game.build_photo
    @local = @game.local_rival
    @visitor = @game.visitor_rival
    @teams = Team.where(:category_id => @championship.category_id)
  end
  
  def create
    @championship = Championship.find(params[:championship_id])
    @game = @championship.games.build(params[:game])
    @teams = Team.where(:category_id => @championship.category_id)
    #Add teams
    if (params[:local] && params[:visitor]) && (params[:local] != params[:visitor] )
      @local = @game.rivals.build(:team_id => params[:local], :local => true)
      @visitor = @game.rivals.build(:team_id => params[:visitor], :local => false)

      @game.rivals << [@local, @visitor]

      if (params[:referi_1] && params[:referi_2]) && (params[:referi_1] != params[:referi_2])
        @referi1 = @game.authorities.build(:referi_id => params[:referi_1])
        @referi2 = @game.authorities.build(:referi_id => params[:referi_2])
        @referi3 = @game.authorities.build(:referi_id => params[:referi_3])
        
        @game.authorities << [@referi1,@referi2,@referi3]

      else
        flash[:error] = "Debe seleccionar dos referis diferentes"
        render :action => 'new' and return
      end

      if @game.save
        flash[:notice] = "Successfully created game."
        redirect_to championship_path(@championship) and return
      else
        render :action => 'new' and return
      end
    else
      flash[:error] = "Debe seleccionar dos equipos diferentes"
      render :action => 'new' and return
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
  def playing_game
    @game = Game.find(params[:game_id])
    @championship = Championship.find(params[:championship_id])
    @local = @game.local
    @visitor = @game.visitor    
  end
  def finish
    @game = Game.find(params[:id])
    @game.update_attributes(:finished => true)    
    if @game.local.goals(@game.id) > @game.visitor.goals(@game.id)
      @game.winner = Winner.create(:team_id => @game.local.id)
    elsif @game.local.goals(@game.id) < @game.visitor.goals(@game.id)
      @game.winner = Winner.create(:team_id => @game.visitor.id)
    else
      @game.winner = nil
    end
    redirect_to championship_game_path(@game)
  end
  
end
