class AddDateToMeasurements < ActiveRecord::Migration[6.1]
  def change
    add_column :measurements, :date, :string
  end
end
