# frozen_string_literal: true

class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  def index
    @carriages = Carriage.all
  end

  def show; end

  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = Carriage.new(carriage_params)

    if @carriage.save
      redirect_to @carriage
    else
      render :new
    end
  end

  def edit; end

  def update
    if @carriage.update(carriage_params)
      redirect_to @carriage
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_path, notice: 'Carriage was successfully destroyed.'
  end

  def forming_carriage_type_array(carriage_type)
    @train.carriages.select { |car| car.carriage_type == carriage_type }
  end

  # carriage_type = 'econom_class'/'compartment', seats_level = top_seats/lower_seats
  def seats_count_in_all_carriages(carriage_type, seats_level)
    carriages = forming_carriage_type_array(carriage_type)
    carriages.sum do |car|
      if seats_level == 'top_seats'
        car.top_seats_count
      elsif seats_level == 'lower_seats'
        car.lower_seats_count
      end
    end
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:carriage_type, :top_seats_count, :lower_seats_count, :train_id)
  end
end
