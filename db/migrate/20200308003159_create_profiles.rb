class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text :introduction
      t.string :address
      t.string :image
      t.string :phone_number
      t.timestamps
    end
  end
end
