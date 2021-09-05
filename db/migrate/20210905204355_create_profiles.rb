class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :age
      t.integer :current_weight
      t.integer :target_weight

      t.timestamps
    end
  end
end
