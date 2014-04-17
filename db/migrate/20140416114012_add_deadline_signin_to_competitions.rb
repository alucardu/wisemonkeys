class AddDeadlineSigninToCompetitions < ActiveRecord::Migration
  def change
    add_column :competitions, :deadline_signin, :datetime
  end
end
