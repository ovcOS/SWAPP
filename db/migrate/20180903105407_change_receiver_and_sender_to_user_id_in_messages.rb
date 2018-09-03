class ChangeReceiverAndSenderToUserIdInMessages < ActiveRecord::Migration[5.2]
  def change
    rename_column :messages, :sender_id, :user_id
    remove_column :messages, :receiver_id
  end
end
