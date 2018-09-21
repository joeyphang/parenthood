class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :workshop, foreign_key: true
      t.string :title
      t.string :date
      t.integer :price
      t.integer :total

      t.timestamps
    end
  end
end
