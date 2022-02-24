class AddCategoryToOuchis < ActiveRecord::Migration[6.0]
  def change
    add_column :ouchis, :category, :string
  end
end
