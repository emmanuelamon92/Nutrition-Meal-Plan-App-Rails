class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :age
      t.integer :current_weight
      t.integer :target_weight
      t.integer :calories
      t.integer :protein
      t.integer :fat
      t.integer :carbohydrates
      t.string :allergies
      t.string :diet
      t.bigint :user_id, null: false

      t.timestamps
    end
  end
end
