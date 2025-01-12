class CreatePrices < ActiveRecord::Migration[8.0]
  def change
    create_table :prices do |t|
      t.decimal :value
      t.string :currency
      t.belongs_to :product, index: true, foreign_key: true
      t.timestamps
    end
  end
end
