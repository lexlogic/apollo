ActiveAdmin.register User do
    permit_params :username, :full_name, :email, :password, :password_confirmation, :role
    config.per_page = 5
    
    filter :role, as: :select, collection: proc { User::ROLES }
    
    index do
        column("Full Name", :sortable => :id) {|user| link_to "#{user.full_name} ", user_path(user) }
        column :username
        column :current_sign_in_at
        column :last_sign_in_at
        column :sign_in_count
        column :role
        actions
    end
    
    show do |user|
        attributes_table do
            row :full_name
            row :username
            row :email
            row :role
            row :last_seen
        end
    end
    
    form do |f|
        f.inputs "User Details" do
            f.input :full_name
            f.input :username
            f.input :email
            f.input :password
            f.input :password_confirmation
            f.input :role, as: :radio, collection: User::ROLES if current_user.role == 'admin' or current_user.role == 'supervisor'
        end
        f.actions
    end
 
end