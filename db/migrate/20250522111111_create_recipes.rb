class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :instruction
      t.string :image
      t.string :ingredients, array: true, default: []

      t.timestamps
    end
  end
end
