class AddKeywordsToSearches < ActiveRecord::Migration[5.0]
  def change
    add_column :searches, :keywords, :string
  end
end
