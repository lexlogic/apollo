ActiveAdmin.register Category do
    permit_params :name, :category_id
    config.filters = false

    
    index do
        column("Name", :sortable => :id) {|category| link_to "#{category.name} ", category_path(category) }
        column "Parent Category", (:category_id) do |category| 
            category.category_id? ? category.category : 'Parent'
        end
        actions
    end
    controller do
        before_action :update_scopes, :only => :index
    
        def update_scopes
          resource = active_admin_config
    
          Category.all.each do |m|
            next if !m.category_id.blank?
            next if resource.scopes.any? { |scope| scope.name == m.name }
            resource.scopes << (ActiveAdmin::Scope.new m.name do |categories|
              categories.where(:category_id => m.id)
            end)
          end
          
          resource.scopes.delete_if do |scope|
            !(Category.all.any? { |m| scope.name == m.name })
          end
        end
    end
end
