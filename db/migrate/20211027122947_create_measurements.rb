class CreateMeasurements < ActiveRecord::Migration[6.1]
  def change
    create_table :measurements do |t|
      t.string :pages_read
      t.string :pages_left
      t.string :percent_left
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
