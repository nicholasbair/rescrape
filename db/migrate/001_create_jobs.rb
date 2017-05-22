class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :city
      t.string :state
      t.string :description
      t.string :url
      t.integer :company_id
    end
  end
end
