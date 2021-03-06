class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :limit  => 20, :not_null => true
      t.string :email, :limit => 30, :not_null => false
      t.string :user_photo_file_name
      t.string :user_photo_content_type
      t.integer :user_photo_file_size
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
