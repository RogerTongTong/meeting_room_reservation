class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :room_id
      t.integer :user_id
      t.date :data
      t.string :time

      t.timestamps null: false
    end
  end
end
