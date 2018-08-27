class AddNameAndProfilePhotoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :profile_photo, :string
  end
end
