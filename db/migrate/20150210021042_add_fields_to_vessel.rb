class AddFieldsToVessel < ActiveRecord::Migration
  def change
    remove_column :vessels, :captain
    add_column :vessels, :flag_of_registry, :string
    add_column :vessels, :owner_operator, :string
    add_column :vessels, :grt, :string
    add_column :vessels, :dwt, :string
    add_column :vessels, :loa, :string
    add_column :vessels, :service_speed, :string
    add_column :vessels, :conference, :string
    add_column :vessels, :type, :integer
    add_column :vessels, :type_of_service, :string
    add_column :vessels, :num_of_booms, :integer
    add_column :vessels, :capacity_boom, :string
    add_column :vessels, :type_of_boom, :string
    add_column :vessels, :num_of_hatches, :integer
    add_column :vessels, :type_of_hatch, :string
    add_column :vessels, :boom_cycle, :string
    add_column :vessels, :customs_reg_number, :string
    add_column :vessels, :voyage_num, :string
  end
end
