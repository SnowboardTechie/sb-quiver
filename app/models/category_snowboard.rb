class CategorySnowboard < ActiveRecord::Base
  belongs_to :snowboard
  belongs_to :category
end
