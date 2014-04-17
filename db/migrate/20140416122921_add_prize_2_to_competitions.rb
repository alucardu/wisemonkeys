class AddPrize2ToCompetitions < ActiveRecord::Migration
  def change
    add_column :competitions, :prize_2, :string
  end
end
