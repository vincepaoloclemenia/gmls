class AddNrtToVessels < ActiveRecord::Migration
  def change
    add_column :vessels, :nrt, :string    
  end
end
