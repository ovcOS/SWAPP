class ChangeColumnInMedia < ActiveRecord::Migration[5.2]
  def change
    rename_column :media, :url, :path
  end
end
