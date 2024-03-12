class GoalsController < ApplicationController
  include Secured

  def index
    goals = @current_user.goals
    render json: goals.as_json(methods: :total_progress)
  end

  def create
    goal = Goal.new(goal_params.merge(user_id: @current_user.id))
    if goal.save
      render json: goal, status: :created
    else
      render json: goal.errors, status: :unprocessable_entity
    end
  end

  def show
    goal = Goal.find(params[:id])
    render json: goal.as_json(methods: :total_progress)
  end

  private

  def goal_params
    params.require(:goal).permit(:description, :short_desc, :target_date, :target_value, :starting_value)
  end
end
