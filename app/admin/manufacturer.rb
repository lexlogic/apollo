ActiveAdmin.register Manufacturer do
    permit_params :name
    config.per_page = 5
    
    filter :name
    
    index do
        column("Manufacturer", :sortable => :id) {|manufacturer| link_to "#{manufacturer.name} ", manufacturer_path(manufacturer) }
    end
end
