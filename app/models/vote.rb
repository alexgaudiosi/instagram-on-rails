class Vote < ActiveRecord::Base
  belongs_to :post
  enum direction: [:up, :down]
end
