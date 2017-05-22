class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :city
      t.string :state
      t.integer :job_site_id
    end
  end
end
