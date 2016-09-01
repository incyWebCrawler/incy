class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :url
      t.string :title
      t.string :links

      t.timestamps
    end
  end
end
