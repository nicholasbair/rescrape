class CreateHome < ActiveRecord::Migration[5.0]
  def change
    create_table :home do |t|
      t.string :city
      t.string :state
    end
  end
end
