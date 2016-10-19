class Category < ActiveRecord::Base
  has_many :category_snowboards
  has_many :snowboards, through: :category_snowboards
  belongs_to :user
  validates_presence_of :name
  validates_uniqueness_of :name, scope: :user_id
  extend Slugable::ClassMethods
  include Slugable::InstanceMethods
end
