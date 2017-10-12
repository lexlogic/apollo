ActiveAdmin.register TaskList do
    permit_params :name, :status
    config.per_page = 5

    menu label: "Task List"
    
    filter :status, as: :select, collection: proc { TaskList::STATUS }
    
    scope :open, :default => true do |task_list|
      task_list.where(:status => 'open')
     end
    scope :started do |task_list|
      task_list.where(:status => 'started')
     end
    scope :complete do |task_list|
      task_list.where(:status => 'complete')
     end
    
    index pagination_total: false do
        column("Task") {|task_list| link_to "#{task_list.name} ", task_list_path(task_list) }
        column :user
        column :updated_at, :sortable => :updated_at
        column("Status")    {|item| status_tag(item.status, 
            if item.status == 'open'
                :red
            else if item.status == 'started'
                :blue
            else
                :green    
            end
        end
        )}
    end
    
    show :title => "" do |task_list|
        attributes_table do
            row :name
            row :created_at
            row("Status")    {|item| status_tag(item.status, 
            if item.status == 'open'
                :red
            else if item.status == 'started'
                :blue
            else
                :green    
            end
        end
        )}
        end
        active_admin_comments
    end
    
    form do |f|
        f.inputs "User Details" do
            f.input :name, label: "Task Name"
            if !f.object.new_record?
                f.input :status, as: :select2, :input_html => { :style => 'width:80%' }, collection: TaskList::STATUS if current_user.role == 'admin'
            end
        end
        f.actions
    end
    
    controller do
        def create
            @task_list = current_user.task_list.build(permitted_params[:task_list])   
            
            respond_to do |format|
                if @task_list.save
                    format.html { redirect_to @task_list, notice: 'Task was successfully created.' }
                else
                    format.html { render action: "new" }
                end
            end
        end
    end    
end