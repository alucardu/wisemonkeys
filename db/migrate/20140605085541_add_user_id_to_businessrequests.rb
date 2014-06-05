class AddUserIdToBusinessrequests < ActiveRecord::Migration
  def change
    add_column :businessrequests, :user_id, :integer
  end
end
