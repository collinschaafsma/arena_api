class AddDefaultStatusToContest < ActiveRecord::Migration[5.2]
  def change
    change_column :contests, :status, :integer, default: 0
  end
end
