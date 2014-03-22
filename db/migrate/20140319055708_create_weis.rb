class CreateWeis < ActiveRecord::Migration
  def change
    create_table :weis do |t|
      t.string :User
      t.float :latitude
      t.float :longitude
      t.string :address
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
