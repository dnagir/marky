class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string  :email
      t.string  :crypted_password
      t.string  :password_salt
      t.string  :persistence_token
      t.boolean :confirmed, :default => false, :null => false
      t.boolean :enabled,   :default => false, :null => false
      t.string  :title
      t.string  :first_name
      t.string  :last_name
      t.string  :first_name
      t.string  :company_name
      t.string  :phone
      t.integer :permission_level, :default => 0, :null => false

      t.timestamps
    end
    add_index 'users', 'email', :name => 'users_email_index' ,:unique => true
  end

  def self.down
    remove_index 'users', 'users_email_index'
    drop_table :users
  end
end

