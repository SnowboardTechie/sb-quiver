class Catagory < ActiveRecord::Base
  has_many :snowboards
  belongs_to :user

end
