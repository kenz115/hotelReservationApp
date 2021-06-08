class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :address
      t.text :introduction
      t.integer :fee
      t.string :image

      t.timestamps
    end
  end
end
