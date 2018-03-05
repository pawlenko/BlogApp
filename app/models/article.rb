class Article < ApplicationRecord
    belongs_to :user
    belongs_to :category

    has_attached_file :image, :styles => { medium: "750x300", thumb: "200x200>" }
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\z/,:message =>'--- incorrect file type  ---'
    validates_attachment_size :image,:in => 0..850.kilobytes,:message=>'--- file size it too big  ---'


end
