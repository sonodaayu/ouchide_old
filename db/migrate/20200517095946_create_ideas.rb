class CreateIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :ideas do |t|
      t.references :ouchi

      t.timestamps
    end
  end
end
