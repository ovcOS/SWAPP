class ChangeRequesterIdToUserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :connections, :requester_id, :user_id
  end
end
