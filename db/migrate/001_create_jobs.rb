class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :location
      t.string :description
      t.string :url
      t.integer :company_id
    end
  end
end
