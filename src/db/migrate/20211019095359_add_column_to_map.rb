class AddColumnToMap < ActiveRecord::Migration[6.1]
  def change
    add_reference :maps, :post, null: false, foreign_key: true
  end
end
