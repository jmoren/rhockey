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
    @teams = Team.where(:category_id => @championship.category_id)
    #Add teams
    if (params[:local].blank? && params[:visitor].blank?) && (params[:local] != params[:visitor] )
      @local = @game.rivals.build(:team_id => params[:local], :local => true)
      @visitor = @game.rivals.build(:team_id => params[:visitor], :local => false)

      @game.rivals << [@local, @visitor]

      if (params[:referi_1].blank? && params[:referi_2].blank?) && (params[:referi_1] != params[:referi_2])
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
end
