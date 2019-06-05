class GradeCrite < ApplicationRecord
  extend Enumerize

  belongs_to :grade_record
  validates :status, presence: true, if: Proc.new {|grade_criteria| grade_criteria.criteria_type == Constants::CRITERIA_TYPE_PASS_FAIL}
  validates :point, presence: true, if: Proc.new {|grade_criteria| grade_criteria.criteria_type == Constants::CRITERIA_TYPE_POINT}
  validates :comment, presence: true

  enumerize :criteria_type, in: [Constants::CRITERIA_TYPE_PASS_FAIL, Constants::CRITERIA_TYPE_POINT]
  enumerize :status, in: [Constants::CRITERIA_STATUS_PASSED, Constants::CRITERIA_STATUS_FAILED]
  #
  # def is_pass_fail_type?
  #   criteria_type == Constants::CRITERIA_TYPE_PASS_FAIL
  # end
  #
  # def is_point_type?
  #   criteria_type == Constants::CRITERIA_TYPE_POINT
  # end
  def get_status
    if criteria_type == Constants::CRITERIA_TYPE_PASS_FAIL
      temp_status = status
    else
      temp_status = point.zero? ? Constants::CRITERIA_STATUS_FAILED : Constants::CRITERIA_STATUS_PASSED
    end
    temp_status
  end
end