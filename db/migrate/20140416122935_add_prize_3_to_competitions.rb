class AddPrize3ToCompetitions < ActiveRecord::Migration
  def change
    add_column :competitions, :prize_3, :string
  end
end
