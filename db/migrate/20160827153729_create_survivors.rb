class CreateSurvivors < ActiveRecord::Migration[5.0]
  def change
    create_table :survivors do |t|
      t.string :name
      t.string :gender
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :long, precision: 10, scale: 6
      t.integer :infected_reports

      t.timestamps
    end
  end
end
