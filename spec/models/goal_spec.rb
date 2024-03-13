require 'rails_helper'

RSpec.describe Goal, type: :model do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }

  describe 'validations' do
    it 'is valid with valid attributes' do
      goal = user.goals.build(
        description: 'Read more books', 
        short_desc: 'Reading', 
        target_date: Date.today + 30, 
        target_value: 10, 
        starting_value: 0
      )
      expect(goal).to be_valid
    end

    it 'is not valid without a description' do
      goal = user.goals.build(
        short_desc: 'Reading', 
        target_date: Date.today + 30, 
        target_value: 10, 
        starting_value: 0
      )
      expect(goal).not_to be_valid
      expect(goal.errors.messages[:description]).to include("can't be blank")
    end

    it 'is not valid without a short description' do
      goal = user.goals.build(
        description: 'Read more books', 
        target_date: Date.today + 30,
        target_value: 10, 
        starting_value: 0
      )
      expect(goal).not_to be_valid
      expect(goal.errors.messages[:short_desc]).to include("can't be blank")
    end

    it 'is not valid without a target date' do
      goal = user.goals.build(
        description: 'Read more books', 
        short_desc: 'Reading', 
        target_value: 10, 
        starting_value: 0
      )
      expect(goal).not_to be_valid
      expect(goal.errors.messages[:target_date]).to include("can't be blank")
    end

    it 'is valid when target_value is greater than starting_value' do
      goal = user.goals.build(
        target_date: Date.today + 30,
        description: 'Read more books', 
        short_desc: 'Reading', 
        target_value: 10, 
        starting_value: 0
      )
      expect(goal).to be_valid
    end

    it 'is not valid when target_value is less than or equal to starting_value' do
      goal = user.goals.build(
        target_date: Date.today + 30,
        description: 'Read more books', 
        short_desc: 'Reading', 
        target_value: 5, 
        starting_value: 5
      )
      expect(goal).not_to be_valid
      expect(goal.errors[:target_value]).to include('must be greater than starting value')

      goal.target_value = 4
      goal.validate
      expect(goal.errors[:target_value]).to include('must be greater than starting value')
    end
  end

  describe '#total_progress' do
    it 'returns the sum of progress values from associated stats' do
      goal = user.goals.create(description: 'Read more books', short_desc: 'Reading', target_date: Date.today + 30, target_value: 10, starting_value: 0)
      goal.stats.create(progress_value: 2, recorded_date: Date.today + 5)
      goal.stats.create(progress_value: 3, recorded_date: Date.today + 7)

      expect(goal.total_progress).to eq(5)
    end

    it 'returns zero when there are no stats' do
      goal = user.goals.create(description: 'Read more books', short_desc: 'Reading', target_date: Date.today + 30, target_value: 10, starting_value: 0)

      expect(goal.total_progress).to eq(0)
    end
  end
end
