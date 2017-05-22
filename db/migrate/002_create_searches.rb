class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :city
      t.string :state
      t.string :location
      t.integer :job_site_id
    end
  end
end
