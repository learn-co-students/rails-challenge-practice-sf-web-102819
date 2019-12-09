class EmployeesController < ApplicationController
   

      def create
        params[:id]
        if @employee = Employee.create(employee_params)
          @employee.save
          redirect_to company_path(params[:employee][:company_id])
        else
          render "new"
        end
      end
    
      def edit
        @employee = Employee.find(params[:id])
      end
    
      def update
        @employee = Employee.find(params[:id])
        if @employee.update(employee_params)
          redirect_to @employee 
        else
          render "edit"
        end
      end
    
    
    
      private
    
      def employee_params
        params.require(:employee).permit(:name, :title, :company_id)
      end
    end