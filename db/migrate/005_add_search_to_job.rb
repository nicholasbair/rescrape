class AddSearchToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :search_id, :integer
  end
end
