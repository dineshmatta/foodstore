class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity
      t.integer :price
      t.string :pincode
      t.date :available_from
      t.date :available_to
      t.time :pickup_from
      t.time :pickup_to
      t.boolean :publish
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
