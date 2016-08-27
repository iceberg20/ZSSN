class CreateSurvivors < ActiveRecord::Migration[5.0]
  def change
    create_table :survivors do |t|
      t.string :name
      t.string :gender
      t.decimal :lat
      t.decimal :long
      t.boolean :infected

      t.timestamps
    end
  end
end
