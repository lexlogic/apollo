ActiveAdmin.register Department do
    permit_params :name, :department_id
    config.per_page = 5
    
    filter :name
    
    index do
        column("Name", :sortable => :id) {|department| link_to "#{department.name} ", department_path(department) }
        column "Parent Department", (:department_id) do |department| 
            department.department_id? ? department.department : 'Parent'
        end
        actions
    end
    controller do
        before_action :update_scopes, :only => :index
    
        def update_scopes
          resource = active_admin_config
    
          Department.all.each do |m|
            next if !m.department_id.blank? 
            next if resource.scopes.any? { |scope| scope.name == m.name }
            resource.scopes << (ActiveAdmin::Scope.new m.name do |departments|
              departments.where(:department_id => m.id)
            end)
          end
          
          resource.scopes.delete_if do |scope|
            !(Department.all.any? { |m| scope.name == m.name })
          end
        end
    end
end
