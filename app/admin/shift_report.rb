ActiveAdmin.register ShiftReport do
    
    permit_params :name, :description, :down_time, :equipment_id, :department_id, :location_id
    config.filters = false
    config.per_page = 5
    
    
    index pagination_total: false do
        column("Shift Report Number") {|report| link_to "#{report.updated_at.strftime("%Y%m%d%H")} ", shift_report_path(report) }
        column :name
        column("Shift Report Date") {|report| report.created_at.strftime("%h #{report.created_at.day.ordinalize} %Y")}
    end
    
    show :title => "" do
        panel "Shift Report Entries" do
          table_for shift_report.shift_entries do |entries|
            column("Time", :created_at)
            column("Job Name", :job_name)
            column :description do |entry|
                raw(entry.description) 
            end
            column :downtime
            column :department
            column :location
            column :actions do |entry|
                links = ''.html_safe
                links += link_to I18n.t('active_admin.edit'), edit_shift_entry_path(entry), :class => "member_link edit_link"
                links += link_to I18n.t('active_admin.delete'), shift_entry_path(entry), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
                links
            end
        end
    end
        active_admin_comments
    end
    
    form do |f|
        f.inputs do
          f.input :name, label: "Shift"
        end
        f.actions
    end
    
    action_item :view, only: :show do
      link_to 'New Shift Entries', new_shift_entry_path(:shift_entry => {:shift_report_id => shift_report.id})
      
    end
end
