class CreateRisks < ActiveRecord::Migration[5.0]
  def change
    create_table :risks do |t|
      t.string :name
      t.string :label
      t.integer :probability
      t.integer :impact
      t.integer :controls

      t.timestamps
    end
  end
end
