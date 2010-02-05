class AddAttachmentsBeforeAndAfterToSample < ActiveRecord::Migration
  def self.up
    add_column :samples, :original_image_file_name, :string
    add_column :samples, :original_image_content_type, :string
    add_column :samples, :original_image_file_size, :integer
    add_column :samples, :processed_image_file_name, :string
    add_column :samples, :processed_image_content_type, :string
    add_column :samples, :processed_image_file_size, :integer
  end

  def self.down
    remove_column :samples, :original_image_file_name
    remove_column :samples, :original_image_content_type
    remove_column :samples, :original_image_file_size
    remove_column :samples, :processed_image_file_name
    remove_column :samples, :processed_image_content_type
    remove_column :samples, :processed_image_file_size
  end
end
