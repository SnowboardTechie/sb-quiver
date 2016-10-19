class Snowboard < ActiveRecord::Base
  belongs_to :user
  has_many :category_snowboards
  has_many :categories, through: :category_snowboards
end
