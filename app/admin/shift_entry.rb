ActiveAdmin.register ShiftEntry do
    permit_params :job_name, :time, :shift_report_id, :description, :downtime, :department_id, :location_id
    menu false
    
    form do |f|
        f.inputs do
          f.input :shift_report
          f.input :time, label: "Time Completed"
          f.input :job_name, label: "Job Name"
          f.input :description, label: "Job Description", as: :html_editor
          f.input :downtime
          f.input :location_id, :label => 'Location', :as => :select2, :input_html => { :style => 'width:80%' }, :collection => Location.all.map{|l| ["#{l.name}", l.id]}
          f.input :department_id, :label => 'Department', :as => :select2, :input_html => { :style => 'width:80%' }, :collection => Department.all.map{|d| ["#{d.name}", d.id]}
        end
        f.actions
    end
    
    controller do
        def create
          create! do |format|
            format.html {redirect_to controller: "shift_reports", action: :show, id: params[:shift_entry][:shift_report_id]}
          end    
        end
        def update
          update! do |format|
            format.html {redirect_to controller: "shift_reports", action: :show, id: params[:shift_entry][:shift_report_id]}
          end    
        end
        def destroy
          destroy! do |format|
            format.html {redirect_to controller: "shift_reports", action: :index}
          end    
        end
    end
end
