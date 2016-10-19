class Category < ActiveRecord::Base
  has_many :snowboards
  belongs_to :user
  validates_presence_of :name
  extend Slugable::ClassMethods
  include Slugable::InstanceMethods
end
