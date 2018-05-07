class CreateRecipeTable < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :drinkid
    end
  end
end
