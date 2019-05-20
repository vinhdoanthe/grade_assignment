ActiveAdmin.register Criteria do

  permit_params :rubric_id, :index, :criteria, :outcome, :meet_the_specification,
                :mandatory, :criteria_type, :weight
end
