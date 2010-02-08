class CreateJobTypes < ActiveRecord::Migration
  def self.up
    create_table :job_types do |t|
      t.string :name
      t.string :description
      t.decimal :price, :precision => 8, :scale => 2
      #t.column 'price', :decimal, :precision => 8, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :job_types
  end
end

