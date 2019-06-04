ActiveAdmin.register Mentor do
  active_admin_import
  
  form do |form|
    title form.object.new_record? ? 'Add new user' : 'Edit user'
    form.semantic_errors
    inputs 'Mentor information' do
      form.input :email
      form.input :password
    end
    form.actions
  end

  permit_params :email, :password

end
