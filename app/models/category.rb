class Category < ActiveRecord::Base
  has_many :category_snowboards
  has_many :snowboards, through: :category_snowboards
  belongs_to :user
  validates_presence_of :name
  extend Slugable::ClassMethods
  include Slugable::InstanceMethods
end
