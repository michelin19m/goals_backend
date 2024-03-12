class StatsController < ApplicationController
  before_action :set_goal
  before_action :set_stat, only: :destroy

  def index
    @stats = @goal.stats
    render json: @stats
  end

  def create
    @stat = @goal.stats.build(stat_params)
    if @stat.save
      render json: @stat, status: :created
    else
      render json: @stat.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @stat.destroy!
      render json: @stat, status: 200
    else
      render json: @stat.errors, status: :unprocessable_entity
    end
  end
  private

  def set_stat
    @stat = Stat.find(params[:id])
  end

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end

  def stat_params
    params.require(:stat).permit(:recorded_date, :progress_value)
  end
end
