class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.string :status, default: 'pending'
      t.string :request
      t.bigint :requester_id, index: true
      t.bigint :responder_id, index: true

      t.timestamps
    end
  end
end
