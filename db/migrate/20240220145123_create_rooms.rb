class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :name

      t.timestamps
    end
    add_reference :messages, :room, index: true
  end
end
