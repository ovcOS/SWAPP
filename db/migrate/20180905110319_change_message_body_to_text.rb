class ChangeMessageBodyToText < ActiveRecord::Migration[5.2]
  def change
    change_column :messages, :body, :text
  end
end
