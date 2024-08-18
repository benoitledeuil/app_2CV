class CreateDeuxChevaux < ActiveRecord::Migration[7.1]
  def change
    create_table :deux_chevaux do |t|
      t.integer :kilometers
      t.float :tank_capacity, default: 20.0
      t.float :fuel_remaining, default:20.0

      t.timestamps
    end
  end
end
