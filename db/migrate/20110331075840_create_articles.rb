class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title, :limit => 120, :not_null => true
      t.text :article, :not_null => false
      t.integer :cord_x, :not_null => false, :default => 0
      t.integer :cord_y, :not_null => false, :default => 0
      t.string :article_photo_file_name
      t.string :article_photo_content_type
      t.string :article_photo_file_size
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
