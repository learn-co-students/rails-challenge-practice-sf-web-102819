class BuildingsController < ApplicationController

    def show
        @building = Building.find(params[:id])
    end

    def index 
        @buildings= Building.all
    end
end