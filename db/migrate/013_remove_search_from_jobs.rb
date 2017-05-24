class RemoveSearchFromJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :search_id, :integer
  end
end
