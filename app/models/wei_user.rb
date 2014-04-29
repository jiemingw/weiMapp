class WeiUser < ActiveRecord::Base
  geocoded_by :address
  has_attached_file :avatar, styles: {
  thumb: '100x100>',
  square: '200x200#',
  medium: '300x300>'
  }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  after_validation :geocode
end