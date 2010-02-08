class Sample < ActiveRecord::Base

  has_attached_file :original_image,
                    :styles => { :listing => '200x150>', :original => '1024x768>'},
                    :path => ":rails_root/public/assets/samples/:id/original-:style-:filename",
                    :url => "/assets/samples/:id/original-:style-:filename"

  has_attached_file :processed_image,
                    :styles => { :listing => '200x150>', :original => '1024x768>'},
                    :path => ":rails_root/public/assets/samples/:id/processed-:style-:filename",
                    :url => "/assets/samples/:id/processed-:style-:filename"

  validates_presence_of :title, :description
  validates_length_of :title, :within => 5..20
  validates_length_of :description, :within => 10..50

  [:original_image, :processed_image].each do |which|
    validates_attachment_presence which
    validates_presence_of which # TODO: Fix validationReflection to avoid double validation here
    validates_attachment_content_type which, :content_type => ['image/jpeg', 'image/jpg', 'image/gif', 'image/png']
    validates_attachment_size which, :less_than => 2.megabytes
  end
end

