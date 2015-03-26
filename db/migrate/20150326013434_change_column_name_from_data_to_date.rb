class ChangeColumnNameFromDataToDate < ActiveRecord::Migration
  def change
    rename_column :reservations, :data, :date
  end
end
