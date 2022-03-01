class CreateMeasurements < ActiveRecord::Migration[6.1]
  def change
    create_table :measurements do |t|
      t.integer :pages_read
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :date

      t.timestamps
    end
  end
end
