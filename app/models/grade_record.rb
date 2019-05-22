# frozen_string_literal: true

class GradeRecord < ApplicationRecord
  extend Enumerize

  belongs_to :rubric
  has_many :grade_crites, dependent: :destroy
  accepts_nested_attributes_for :grade_crites
  validates :learner_email, presence: true
  validates :mentor_email, presence: true
  validates :comment, presence: true

  enumerize :grade_type, in: [Constants::GRADE_TYPE_FIRSTGRADE, Constants::GRADE_TYPE_REGRADE]
  attribute :grade_type, default: Constants::GRADE_TYPE_FIRSTGRADE

  def display_name
    "Grade for #{rubric.assignment}"
  end

  def calculate_point
    self.point = 0

    # Calculate point
    grade_crites.each do |grade_criteria|
      if grade_criteria.criteria_type == Constants::CRITERIA_TYPE_PASS_FAIL
        if grade_criteria.status == Constants::CRITERIA_STATUS_PASSED
          self.point = point + grade_criteria.weight
        else # CRITERIA_STATUS_FAILED
          # Point is not increased if failed
        end
      else # CRITERIA_TYPE_POINT
        puts "grade_criteria.point #{grade_criteria.point}"
        self.point = point + (grade_criteria.point / Constants::CRITERIA_MAX_POINT) * grade_criteria.weight
      end
    end

    self.point = 10 * (point / rubric.total_weight)
    if grade_type == Constants::GRADE_TYPE_REGRADE
      self.point = point / 2
      # Do not divide to 2
    end

    # Calculate status
    self.status = Constants::GRADE_STATUS_PASSED
    grade_crites.each do |grade_criteria|
      if grade_criteria.mandatory
        puts "grade_criteria.criteria_type #{grade_criteria.criteria_type}"
        puts "grade_criteria.status #{grade_criteria.status}"

        if grade_criteria.criteria_type == Constants::CRITERIA_TYPE_PASS_FAIL
          if grade_criteria.status == Constants::CRITERIA_STATUS_FAILED
            self.status = Constants::GRADE_STATUS_NOT_PASSED
          end
        else
          if grade_criteria.point.zero?
            self.status = Constants::GRADE_STATUS_NOT_PASSED
          end
        end
      end
    end
  end

  def build_content
    sheet_values = Array.new

    sheet_values << Time.now.strftime('%d-%m-%Y')
    puts "Time.now #{Time.now.strftime('%d-%m-%Y')}"
    sheet_values << rubric.course_instance
    sheet_values << rubric.assignment
    sheet_values << mentor_email
    sheet_values << learner_email
    sheet_values << learner_name
    # TODO: Update grade_criterias
  end
end