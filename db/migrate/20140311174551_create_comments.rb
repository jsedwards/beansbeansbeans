class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.string :tip
      t.references :listing, index: true

      t.timestamps
    end
  end
end
