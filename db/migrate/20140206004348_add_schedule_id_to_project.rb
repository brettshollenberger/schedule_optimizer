class AddScheduleIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :schedule_id, :integer, null: false
  end
end
