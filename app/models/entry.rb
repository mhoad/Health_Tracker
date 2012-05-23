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

  def self.weight_on(date)
    where("date(date) = ?",date).sum(:weight)
  end

  def self.fat_percentage_on(date)
    where("date(date) = ?",date).sum(:body_fat)
  end

  def self.muscle_percentage_on(date)
    where("date(date) = ?",date).sum(:muscle)
  end

  def self.water_percentage_on(date)
    where("date(date) = ?",date).sum(:water)
  end

  def self.fitocracy_score_on(date)
    where("date(date) = ?",date).sum(:fitocracy_score)
  end

end