class TeamPlayersController < ApplicationController

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
end
