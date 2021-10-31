class ChangeDataTypeForPagesRead < ActiveRecord::Migration[6.1]
  def self.up
    change_table :measurements do |t|
      t.change :pages_read, :string
    end
  end
  def self.down
    change_table :measurements do |t|
      t.change :pages_read, :integer
    end
  end
end
