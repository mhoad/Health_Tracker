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
  attr_accessible :body_fat, :date, :fitocracy_score, :muscle, :water, :weight, :user_id

  belongs_to :user

  validates :body_fat, presence: true
  validates :date, presence: true, :uniqueness => { :scope => :user_id }
  validates :muscle, presence: true
  validates :water, presence: true
  validates :weight, presence: true

  def self.weight_on(date, user)
    @entry = Entry.where("user_id = ? AND date = ?", user, date).first
    if @entry != nil
      @entry.weight
    else
      return 0
    end
  end

  def self.fat_percentage_on(date, user)
    @entry = Entry.where("user_id = ? AND date = ?", user, date).first    
    if @entry != nil 
      @entry.body_fat
    else
      return 0
    end
  end

  def self.muscle_percentage_on(date, user)
    @entry = Entry.where("user_id = ? AND date = ?", user, date).first    
    if @entry != nil 
      @entry.muscle
    else
      return 0
    end
  end

  def self.water_percentage_on(date, user)
    @entry = Entry.where("user_id = ? AND date = ?", user, date).first    
    if @entry != nil 
      @entry.water
    else
      return 0
    end
  end

  def self.fitocracy_score_on(date, user)
    @entry = Entry.where("user_id = ? AND date = ?", user, date).first   
    if @entry != nil 
      @entry.fitocracy_score
    else
      return 0
    end
  end

  

end