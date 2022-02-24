class AddIdeaToIdeas < ActiveRecord::Migration[6.0]
  def change
    add_column :ideas, :idea, :text
  end
end
