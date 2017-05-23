class AddDistanceToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :distance, :float
    add_column :jobs, :duration, :string
    add_column :jobs, :duration_in_traffic, :string
  end
end
