class GradeRecord < ApplicationRecord
  belongs_to :rubric
  has_many :grade_criterias
  accepts_nested_attributes_for :grade_criterias
end