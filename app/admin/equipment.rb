ActiveAdmin.register Equipment do
    permit_params :name, :description, :status, :manufacturer_id, :serial, :category_id, :location_id, part_ids: []
    config.per_page = 5
    
    filter :status, as: :select, collection: proc { Equipment::STATUS }
    filter :category, as: :select, collection: proc { Category.all.where('category_id > ?', 0) }
    
    index do
        column("Name", :sortable => :id) {|equipment| link_to "#{equipment.name} ", equipment_path(equipment) }
        column("Status")    {|item| status_tag(item.status, 
            if item.status == 'online'
                :green
            else
                :red
            end
        )}
        column :manufacturer
        column :serial
        column :category_id
        column :location_id
        actions
    end
    
    show do |equipment|
        attributes_table do
            row :name
            row :description do |equipment_item|
                raw(equipment_item.description) 
            end
            row :location
            row :status
            row :serial
            row :category
            row :manufacturer
        end
        
        panel "Parts List" do
            table_for equipment.parts do |parts|
                column("Name", :sortable => :id) {|part| link_to "#{part.name} ", part_path(part) }
                column :sku
                column :location
                column :department
                column("Quantity In Stock", :qty)
            end
        end
        
        active_admin_comments
    end
    
    form html: { multipart: true } do |f|
        f.inputs do
          f.input :name, label: "Equipment Name"
          f.input :description, label: "Equipment Description", as: :html_editor
          f.input :serial, label: "Serial"
          f.input :status, :label => 'Status', :as => :select2, :input_html => { :style => 'width:80%' }, collection: Equipment::STATUS if current_user.role == 'admin'
          f.input :manufacturer_id, :label => 'Manufacturer', :as => :select2, :input_html => { :style => 'width:80%' }, :collection => Manufacturer.all.map{|m| ["#{m.name}", m.id]}
          f.input :location_id, :label => 'Location', :as => :select2, :input_html => { :style => 'width:80%' }, :collection => Location.all.map{|l| ["#{l.name}", l.id]}
          f.input :category_id, :label => 'Category', :as => :select2, :input_html => { :style => 'width:80%' }, :collection => Category.all.map{|c| ["#{c.name}", c.id]}
          if !f.object.new_record?
            f.input :parts, :label => 'Parts', :as => :select2_multiple, :input_html => { :style => 'width:80%' }, :collection => Part.where("qty > ?", 0).map{|c| ["#{c.name}", c.id]}
          end
        end
        f.actions
    end
    
    controller do
        def update
            @equipment = Equipment.find(permitted_params[:id])
            parts = permitted_params[:equipment][:part_ids]
            
            if @equipment.update_attributes(permitted_params[:equipment])
                parts.each do |part_id|
                    
                    current_part = @equipment.parts.include?(part_id)
                    
                    if !current_part and !part_id.blank?
                        part = Part.find_by_id(part_id)
                        p "LOOK AT ME" + part.to_s
                        part.qty -= 1
                        part.save
                    end
                    @equipment_part = @equipment.parts.build(id: part_id)
                    
                end
            end
            
            respond_to do |format|
                    format.html {redirect_to @equipment}
            end
        end
    end
end
