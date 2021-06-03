class RenameTimeIdColumnToDaysId < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :time_id, :days_id
  end
end
