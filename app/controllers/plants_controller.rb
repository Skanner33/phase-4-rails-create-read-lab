class PlantsController < ApplicationController

    def index
        render json: Plant.all
    end

    def show
        plants = Plant.find_by(id: params[:id])

        if plants
            render json: plants
        else
            render json: {error: 'Plant not found'}
        end
    end

    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    private
    
    def plant_params
        params.permit(:name, :image, :price)
    end

end
