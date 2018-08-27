class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.string :status, default: 'pending'
      t.string :request
      t.references :requester, foreign_key: { to_table: :users }
      t.references :responder, foreign_key: { to_table: :users }


      t.timestamps
    end
  end
end
