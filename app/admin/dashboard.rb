ActiveAdmin.register_page "Dashboard" do
  menu :priority => 1
  
  
  content :title => proc{ I18n.t("active_admin.dashboard") } do
  
    columns do
      
      column do
        panel "Recently Completed Tasks" do
          table_for Todo.where("status = ?", "complete").order('id desc').limit(3).each do |todos|
            column("")    {|todo| link_to(todo.name, todo_path(todo)) }
            column("")    {|todo| status_tag(todo.status)}
          end
        end
      end
      
      column do
        panel "Recent Manufacturers" do
          table_for Manufacturer.order('id desc').limit(5).each do |manufacturers|
            column("")    {|manufacturer| link_to(manufacturer.name, manufacturer_path(manufacturer)) }
          end
        end
      end
    end
    
    columns do
      panel "Recent Activity" do
          table_for PaperTrail::Version.order('id desc').limit(5) do
            column ("Action") { |v| v.event.capitalize }
            column ("Item") { |v| 
              if !v.item 
                "Item was Removed" 
              else v.item 
              end 
            }
            column ("Type") { |v| v.item_type.underscore.humanize }
            #column ("Modified By") { |v| User.find(v.whodunnit).full_name}
          end
      end
    end
    
    columns do
      column do
        panel "Users Online" do
            table_for User.where('last_seen > ?', 1.hour.ago).order('id desc').limit(10).each do |users|
              column(:full_name)    {|user| link_to(user.full_name, user_path(user)) }
              column :email
              column("Status")   {|user| status_tag("Online", :ok) }
            end
        end
      end
    end
  end # content
end