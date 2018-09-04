class RemoveRequestInConnection < ActiveRecord::Migration[5.2]
  def change
    remove_column :connections, :request
  end
end
