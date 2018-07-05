class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find_by(uid: params[:uid])
  end

  def new
    @team = current_user.teams.build
  end

  def create
    @team = current_user.teams.build(team_params)
    @team.uid = SecureRandom.urlsafe_base64
    if @team.save
      set_team_admin
      redirect_to root_path, notice: '作成'
    else
      render :new, notice: '失敗'
    end
  end

  def edit
    @team = Team.find_by(uid: params[:uid])
  end

  private

  def team_params
    params.require(:team).permit(%i[name description logo background])
  end

  def set_team_admin
    TeamUser.find_by(team_id: @team.id, user_id: current_user.id).admin!
  end
end
