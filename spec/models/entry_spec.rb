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

require 'spec_helper'

describe Entry do
  pending "add some examples to (or delete) #{__FILE__}"
end
