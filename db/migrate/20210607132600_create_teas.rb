class CreateTeas < ActiveRecord::Migration[5.2]
  def change
    create_table :teas do |t|
      t.string :title
      t.float :temp
      t.string :description
      t.float :brew_time

      t.timestamps
    end
  end
end
