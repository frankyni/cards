class Project < ActiveRecord::Base
  belongs_to :user
  has_many :cards, ->{ order("position ASC")}, dependent: :destroy
  validates :title, presence: true
end
