class GradeCriteria < ApplicationRecord
  extend Enumerize

  self.table_name = 'grade_criteria'
  belongs_to :grade_record

  enumerize :criteria_type, in: [Constants::CRITERIA_TYPE_PASS_FAIL, Constants::CRITERIA_TYPE_POINT]
  enumerize :status, in: [Constants::CRITERIA_STATUS_PASSED, Constants::CRITERIA_STATUS_FAILED]
end