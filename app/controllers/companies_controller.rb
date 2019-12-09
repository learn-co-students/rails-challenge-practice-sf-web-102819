class CompaniesController < ApplicationController
    def index
        @companies = Company.all
      end
    
      def show
        @company = Company.find(params[:id])
        @employee = Employee.new
      end
    
      def new
        @company = Company.new
      end
    
      def create
        byebug
        if @company = Company.new(company_params)
          @company.save
          redirect_to @company
        else
          render "new"
        end
      end
    
      def edit
        @company = Company.find(params[:id])
      end
    
      def update
        @company = Company.find(params[:id])
        if @company.update(company_params)
          redirect_to @company 
        else
          render "edit"
        end
      end
    
    
    
      private
    
      def company_params
        params.require(:company).permit(:name, office_ids:[], office_attributes: [:floor, :building_id])
      end

    end