# frozen_string_literal: true

class Crite < ApplicationRecord
  extend Enumerize

  belongs_to :rubric

  enumerize :status, in: [Constants::CRITERIA_STATUS_PASSED, Constants::CRITERIA_STATUS_FAILED]
  enumerize :criteria_type, in: [Constants::CRITERIA_TYPE_POINT, Constants::CRITERIA_TYPE_PASS_FAIL]

  def display_name
    "Criteria #{index}"
  end
end
