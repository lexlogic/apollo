ActiveAdmin.register Part do
    permit_params :username, :name, :description, :sku, :part_url, :qty, 
                  :attachment, :location_id, :department_id, :remove_attachment, :checkedIn
    config.per_page = 5
    
    menu label: "Inventory"
    
    filter :name
    filter :location
    filter :department
    
    scope :all, :default => true
    scope :low do |parts|
        parts.where("qty < ?", 5)
    end
    
    index :title => "Inventory" do
        column("Name", :sortable => :id) {|part| link_to "#{part.name} ", part_path(part) }
        column :sku do |part|
            best_in_place part, :sku, as: :input
        end
        column :qty do |part|
            best_in_place part, :qty, as: :input,
                                :place_holder => "Click To Edit",
                                :html_attrs => { :style => 'width:30%' }
        end
        column :location
        column :department
        column :checkedIn
    end
    
    show do |parts|
        columns do
            column do    
                attributes_table do
                    row :name
                    row :description do |part|
                        raw(part.description) 
                    end
                    row :location
                    row :department
                    row :sku
                    row("Vendor URL", :sortable => :id) {|part| link_to "#{part.part_url} ", part.part_url }
                end
            end
            column do
                panel "Attached Documents" do
                    table_for part do
                        column("Attached Documents", :sortable => :id) {|part| link_to "#{part.attachment_identifier} ", part.attachment_url }
                    end
                end
            end
        end
        columns do
            column do
                panel "Inventory at All Locations" do
                    table_for location_list do
                        column :location
                        column :qty
                    end
                end
            end
        end
        active_admin_comments
    end

    form :html => { :enctype => "multipart/form-data" } do |f|
        f.inputs do
          f.input :name, label: "Part Name"
          f.input :description, label: "Part Description", as: :html_editor
          f.input :sku, label: "Part SKU"
          f.input :qty
          f.input :part_url, label: "Part URL"
          f.input :checkedIn
          f.input :department_id, :label => 'Department', :as => :select2, :input_html => { :style => 'width:80%' }, :collection => Department.all.map{|d| ["#{d.name}", d.id]}
          f.input :location_id, :label => 'Location', :as => :select2, :input_html => { :style => 'width:80%' }, :collection => Location.all.map{|l| ["#{l.name}", l.id]}
          f.input :attachment, :as => :file, :hint => "Current Document: " + 
            if f.object.attachment_identifier
                f.object.attachment_identifier
            else
                ""
            end
          f.input :remove_attachment, as: :boolean, required: :false, label: 'Remove Document'
        end
        f.actions
    end
    
    member_action :checkin, method: :post do
        sku = params["sku"]
        # location = params["location"]
        part = Part.find_by(sku: sku)
        part.checkedIn = true
        part.save
    end
    
    controller do
        def show
            @part = Part.find(params[:id])
            @location_list = Part.where("sku = ?", @part.sku)
        end
    end
end
