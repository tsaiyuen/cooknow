class AddInstructionToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :instructions, :string, array: true, default:[]
  end
end
