ActiveAdmin.register Rubric do
  permit_params :rubric_code, :course_instance, :assignment, :description,
                crites_attributes: %i[id index criteria_description
                                      outcome meet_the_specification criteria_type
                                      mandatory weight _destroy]

  show do
    attributes_table do
      row :rubric_code
      row :course_instance
      row :assignment
      row :description
    end

    panel 'Criteria' do
      table_for rubric.crites do
        column :index
        column :criteria_description
        column :outcome
        column :meet_the_specification
        column :criteria_type
        column :weight
        column :mandatory
      end
    end
  end

  form do |form|
    form.semantic_errors
    form.inputs 'Assignment' do
      form.input :rubric_code
      form.input :course_instance
      form.input :assignment
      form.input :description
    end

    form.inputs 'Criteria' do
      form.has_many :crites,
                    new_record: 'Add criteria',
                    allow_destroy: true do |criteria_form|
        criteria_form.semantic_errors

        criteria_form.inputs do
          criteria_form.input :index
          criteria_form.input :criteria_description
          criteria_form.input :outcome
          criteria_form.input :meet_the_specification
          criteria_form.input :criteria_type
          criteria_form.input :weight
          criteria_form.input :mandatory
        end
      end
    end
    form.actions
  end
end
