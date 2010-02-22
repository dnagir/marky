class SampleImagesData
  def self.sample_jpg
    @sample_jpg ||= ActionController::TestUploadedFile.new("test/fixtures/images/sample.jpg", 'image/jpg', true)
    #fixture_file_upload('images/sample.jpg', 'image/jpeg', true)
  end
end

Factory.sequence(:name)         { |n| "short name #{n}" }
Factory.sequence(:description)  { |n| "a bit longer description #{n}" }
Factory.sequence(:email)        { |n| "email_#{n}@email.com" }
Factory.sequence(:amount)       { |n| n + 1.11 }


Factory.define :sample do |o|
  o.title           { Factory.next(:name) }
  o.description     { Factory.next(:description) }
  o.original_image  { SampleImagesData.sample_jpg }
  o.processed_image { SampleImagesData.sample_jpg }
end

Factory.define :job_type do |o|
  o.name            { Factory.next(:name) }
  o.description     { Factory.next(:description) }
  o.price 9.99
end

Factory.define :user do |o|
  o.email           { Factory.next(:email) }
  o.password        { Factory.next(:email) }
  o.password_confirmation { |o| o.password }
  #o.title           { Factory.next(:name) }  
  o.first_name      { Factory.next(:name) }
  o.last_name       { Factory.next(:name) }
  o.phone           '+1 (2) 3 456 789'
  #o.company_name    { |o| o.company_name = o.first_name }
end