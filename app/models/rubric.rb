class Rubric < ApplicationRecord
  has_many :criterias

  def display_name
    "Rubric #{rubric_code}"
  end
end
