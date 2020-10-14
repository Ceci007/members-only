class AddMembersOnlyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :members_only, :boolean, default: false
  end
end
