class ChangeNameToCOlumnInConnection < ActiveRecord::Migration[5.2]
  def change
    rename_column :connections, :user_id, :requester_id
  end
end
