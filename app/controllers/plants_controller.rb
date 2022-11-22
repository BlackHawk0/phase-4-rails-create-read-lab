class PlantsController < ApplicationController
    wrap_parameters format: []
    # fetch all the plants
    def index
        render json: Plant.all
    end

    # fetch a specific plant
    def show
        plant = Plant.find_by(id: params[:id])

        # if present,
        if plant
            render json: plant
        else 
            render json: {error: "Could not find plant"}
        end
    end

    def create
        plant =  Plant.create(plant_params)
        render json: plant, status: :created
    end

    private

    def plant_params
        params.permit(:name, :image, :prize)
    end
end