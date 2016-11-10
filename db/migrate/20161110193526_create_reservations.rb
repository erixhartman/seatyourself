class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :restaurant
      t.date    :date
      t.integer :time


      t.timestamps
    end
  end
end
