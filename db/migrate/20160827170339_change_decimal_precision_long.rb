class ChangeDecimalPrecisionLong < ActiveRecord::Migration[5.0]
  def self.up
  	change_column :survivors, :long, :decimal, :precision => 10, :scale => 6
  end

  def self.down
  	change_column :survivors, :long, :decimal
  end
end
