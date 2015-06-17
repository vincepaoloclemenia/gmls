class Api::EmployeesController < ApplicationController
  before_filter :set_employee, only: [:show, :update, :destroy]

  def index
    @employees = current_user.department.nil? ? Employee.all : Employee.where(department: current_user.department)
    render json: @employees
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.department = current_user.department
    if @employee.save
      render json: @employee, status: :created, employee: [:api, @employee]
    else
      render json: { errors: @employee.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @employee.update(employee_params)
      head :no_content
    else
      render json: { errors: @employee.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @employee.destroy

    head :no_content
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end
    
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :department, :position, :age, :gender, :role_id, :department)
  end
end