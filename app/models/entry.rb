# == Schema Information
#
# Table name: entries
#
#  id              :integer         not null, primary key
#  date            :date
#  body_fat        :float
#  muscle          :float
#  water           :float
#  weight          :float
#  fitocracy_score :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class Entry < ActiveRecord::Base
  attr_accessible :body_fat, :date, :fitocracy_score, :muscle, :water, :weight

  belongs_to :user

  validates :body_fat, presence: true
  validates :date, presence: true, uniqueness: true
  validates :muscle, presence: true
  validates :water, presence: true
  validates :weight, presence: true
  validates :fitocracy_score, presence: false, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
