ActiveAdmin.register Crite do

  belongs_to :rubric

  permit_params :rubric_id, :index, :criteria_description,
                :outcome, :meet_the_specification, :mandatory,
                :criteria_type, :weight

end
