class AddWordsColumnToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :words, :string
  end
end
