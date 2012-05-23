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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    date "2012-05-23"
    body_fat 1.5
    muscle 1.5
    water 1.5
    weight 1.5
    fitocracy_score 1
  end
end
