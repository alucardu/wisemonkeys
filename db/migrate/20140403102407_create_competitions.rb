class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :title
      t.string :description
      t.string :prize
      t.datetime :deadline

      t.timestamps
    end
  end
end
