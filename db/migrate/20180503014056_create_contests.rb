class CreateContests < ActiveRecord::Migration[5.2]
  def change
    create_table :contests do |t|
      t.integer :status
      t.string :contest_type
      t.string :winner_id
      t.datetime :finished_at

      t.timestamps
    end
  end
end
