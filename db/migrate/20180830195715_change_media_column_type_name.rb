class ChangeMediaColumnTypeName < ActiveRecord::Migration[5.2]
  def change
    rename_column :media, :type, :file_type
  end
end
