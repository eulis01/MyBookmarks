class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.string :name
      t.string :url
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :folder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
