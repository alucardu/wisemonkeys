class AddBAccountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :b_account, :boolean, :default => false
  end
end
