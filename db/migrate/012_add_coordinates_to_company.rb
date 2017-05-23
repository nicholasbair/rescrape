class AddCoordinatesToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :lat, :float
    add_column :companies, :lng, :float
  end
end
