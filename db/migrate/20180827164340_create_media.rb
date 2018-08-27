class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.references :user, foreign_key: true
      t.string :type
      t.string :url

      t.timestamps
    end
  end
end
