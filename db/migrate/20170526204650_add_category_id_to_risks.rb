class AddCategoryIdToRisks < ActiveRecord::Migration[5.0]
  def change
    add_reference :risks, :category, foreign_key: true
  end
end
