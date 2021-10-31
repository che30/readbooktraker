class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :isbn
      t.integer :number_of_pages
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
