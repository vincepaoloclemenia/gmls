class CreatePrepservices < ActiveRecord::Migration
  def change
    create_table :prepservices do |t|
    	t.string :vessel_name
    	t.string :voy_no
    	t.string :registry_no
    	t.string :flag
    	t.string :call_sign
    	t.string :master
    	t.string :operator
    	t.string :regular_grt
    	t.string :regular_nwt
    	t.string :dwt
    	t.string :beam
    	t.string :loa
    	t.integer :year_built
    	t.string :type_of_crane
    	t.string :crane_capacity
    	t.string :crane_hook_cycle
    	t.string :no_of_hatches
    	t.string :type_of_hatch_cover
    	t.string :draft_fwd
    	t.string :draft_aft
    	t.string :type
    	t.string :services_required
    	t.string :discharging_term
    	t.string :dangerous_cargo
    	t.string :cargo_rse
    	t.string :berthing_preference
    	t.string :docking_side
    	t.string :representative
    	t.string :ship_agent
    	t.string :address
    	t.string :tel_no
    	t.string :tug_assistance
    	t.string :enclosure
      t.timestamps null: false
    end
  end
end
