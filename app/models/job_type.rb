class JobType < ActiveRecord::Base
  validates_presence_of :name, :description, :price
end

