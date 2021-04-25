class CreateEstates < ActiveRecord::Migration[5.2]
  def change
    create_table :estates do |t|
      t.string :name
      t.integer :rent
      t.text :address
      t.integer :age
      t.text :note

      t.timestamps
    end
  end
end
