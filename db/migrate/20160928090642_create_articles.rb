class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :articles_count, default: 0

      t.timestamps
    end
  end
end
