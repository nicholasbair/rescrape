class UpdateHomeTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :home, :homes
  end
end
