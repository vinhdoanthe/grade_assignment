ActiveAdmin.register GradeRecord do

  filter :learner_email, as: :searchable_select
  filter :mentor_email, as: :searchable_select
  filter :created_at

  show do
    attributes_table do
      row :status
      row :point
      row :comment
      row :grade_type
      row :learner_email
      row :mentor_email
    end
    panel 'Criteria' do
      table_for grade_record.grade_crites do
        column :index
        column :criteria_description
        column :outcome
        column :meet_the_specification
        column :status
        column :point
        column :comment
        column :mandatory
        column :criteria_type
        column :weight
      end
    end
  end

  index do
    selectable_column
    id_column
    column :assignment
    column :status
    column :point
    column :grade_type
    column :learner_email
    column :mentor_email
    column :created_at

    actions
  end

end
