class CreateContestPets < ActiveRecord::Migration[5.2]
  def change
    create_table :contest_pets do |t|
      t.integer :contest_id
      t.string :pet_uid

      t.timestamps
    end
  end
end
