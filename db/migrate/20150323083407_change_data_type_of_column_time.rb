class ChangeDataTypeOfColumnTime < ActiveRecord::Migration
  def change
    change_column :reservations, :time, :integer
  end
end
