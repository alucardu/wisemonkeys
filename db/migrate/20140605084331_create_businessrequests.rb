class CreateBusinessrequests < ActiveRecord::Migration
  def change
    create_table :businessrequests do |t|
      t.string :kvk
      t.string :company
      t.string :phone
      t.text :request

      t.timestamps
    end
  end
end
