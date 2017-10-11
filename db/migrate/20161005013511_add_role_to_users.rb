class AddRoleToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :role, :string
    add_column :users, :username, :string
    add_column :users, :full_name, :string
    
    # User.create! do |u|
    #     u.username     = 'nickmc01'
    #     u.full_name     = 'Nicholas Knight'
    #     u.email     = 'nickmc01@gmail.com'
    #     u.password    = 'Knight!@34'
    #     u.password_confirmation = 'Knight!@34'
    #     u.role = 'admin'
    # end
  end
end
