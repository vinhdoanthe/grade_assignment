class Criteria < ApplicationRecord
  extend Enumerize

  self.table_name = 'criteria'
  belongs_to :rubric

  enumerize :criteria_type, in: [Constants::CRITERIA_TYPE_PASS_FAIL, Constants::CRITERIA_TYPE_POINT]

  def display_name
    "Criteria #{index}"
  end
end
