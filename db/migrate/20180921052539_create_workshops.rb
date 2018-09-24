class CreateWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_table :workshops do |t|
      t.string :title
      t.string :description
      t.string :date
      t.string :time
      t.string :category
      t.integer :price
      t.integer :total
      t.json :avatar

      t.belongs_to :user

      t.timestamps
    end
  end
end
