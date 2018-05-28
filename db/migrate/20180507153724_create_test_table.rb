class CreateTestTable < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.string :name
      t.text :info
    end
  end
end
