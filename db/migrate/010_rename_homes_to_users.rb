class RenameHomesToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_table :homes, :users
  end
end
