class CreateOuchis < ActiveRecord::Migration[6.0]
  def change
    create_table :ouchis do |t|

      t.timestamps
    end
  end
end
