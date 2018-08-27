class CreateTagUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_users do |t|
      t.references :tag, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
