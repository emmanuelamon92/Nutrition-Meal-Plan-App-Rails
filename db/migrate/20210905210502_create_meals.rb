class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.string :title
      t.integer :readyInMinutes
      t.integer :servings
      t.string :sourceUrl
      t.bigint :profile_id, null: false
      t.boolean :favorite

      t.timestamps
    end
  end
end
