class ChangeMembersOnlyDefaultValue < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :members_only, true
  end
end
