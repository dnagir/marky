
Factory.sequence(:name)         { |n| "short name #{n}" }
Factory.sequence(:description)  { |n| "a bit longer description #{n}" }
Factory.sequence(:email)        { |n| "email_#{n}@email.com" }
Factory.sequence(:amount)       { |n| n + 1.11 }
Factory.sequence(:image)        { |n| ActionController::TestUploadedFile.new("test/fixtures/images/sample.jpg", 'image/jpg', true)  }
#fixture_file_upload('images/sample.jpg', 'image/jpeg', true)

Factory.define :sample do |o|
  o.title           { Factory.next(:name) }
  o.description     { Factory.next(:description) }
  o.original_image  { Factory.next(:image) }
  o.processed_image { Factory.next(:image) }
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
end

