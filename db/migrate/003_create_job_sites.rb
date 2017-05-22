class CreateJobSites < ActiveRecord::Migration
  def change
    create_table :job_sites do |t|
      t.string :name
      t.string :base_url
    end
  end
end
