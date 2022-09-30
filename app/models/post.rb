class Post < ApplicationRecord
  enum status: { active: 0, accepted: 1, rejected: 2 }
  paginates_per 13
  belongs_to :user


end
