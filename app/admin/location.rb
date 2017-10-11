ActiveAdmin.register Location do
    permit_params :name, :location_id
    config.per_page = 5
    
    filter :location
    filter :children, label: "Sub Location"
    filter :parts
    filter :equipment
    filter :shift_reports
    
    index do
        column("Location", :sortable => :id) {|location| link_to "#{location.name} ", location_path(location) }
        column "Parent Location", (:location_id) do |location| 
            location.location_id? ? location.location : 'Parent'
        end
    end
    
end
