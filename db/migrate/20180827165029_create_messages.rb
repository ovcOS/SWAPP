class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :connection, foreign_key: true
      t.bigint :sender_id, index: true
      t.bigint :receiver_id, index: true

      t.timestamps
    end
  end
end
