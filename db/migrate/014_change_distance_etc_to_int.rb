class ChangeDistanceEtcToInt < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :distance, :integer
    change_column :jobs, :duration, :integer
    change_column :jobs, :duration_in_traffic, :integer
  end
end
