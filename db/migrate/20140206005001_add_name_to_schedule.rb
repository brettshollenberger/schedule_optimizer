class AddNameToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :name, :string, null: false
  end
end
