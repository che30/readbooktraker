class AddBookReferencesToMeasurement < ActiveRecord::Migration[6.1]
  def change
    add_reference :measurements, :book, null: false, foreign_key: true
  end
end
