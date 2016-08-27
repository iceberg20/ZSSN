class ChangeDecimalPrecisionLat < ActiveRecord::Migration[5.0]
  def self.up
  	change_column :survivors, :lat, :decimal, :precision => 10, :scale => 6
  end

  def self.down
  	change_column :survivors, :lat, :decimal
  end
end
