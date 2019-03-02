class CreateEnergies < ActiveRecord::Migration[5.2]
  def change
    create_table :energies do |t|
      t.integer :label
      t.integer :house_id
      t.integer :year
      t.integer :month
      t.float :temperture
      t.float :daylight
      t.integer :energy_production

      t.timestamps
    end
  end
end
