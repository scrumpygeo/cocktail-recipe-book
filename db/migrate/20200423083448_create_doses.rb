class CreateDoses < ActiveRecord::Migration[6.0]
  def change
    create_table :doses do |t|
      t.text :description
      t.bigint :ingredient_id
      t.bigint :cocktail_id

      t.timestamps
    end
  end
end
