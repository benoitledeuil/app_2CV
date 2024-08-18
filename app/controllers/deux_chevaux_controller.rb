class DeuxChevauxController < ApplicationController
  def index
    @deux_chevaux = DeuxChevaux.first_or_create(kilometers: 0, fuel_remaining: 20.0, tank_capacity: 20.0)
  end

  def update
    @deux_chevaux = DeuxChevaux.first
    distance = params[:kilometers].to_i
    fuel_consumed = distance * consommation_pour_100_km / 100.0

    # Mise à jour des kilomètres et du carburant restant
    @deux_chevaux.kilometers += distance
    @deux_chevaux.fuel_remaining -= fuel_consumed
    @deux_chevaux.save

    # Alerte si le carburant restant est faible
    if @deux_chevaux.fuel_remaining <= 5
      flash[:alert] = "Il est temps de faire le plein !"
    else
      flash[:notice] = "Il vous reste #{@deux_chevaux.fuel_remaining.round(2)} litres dans le réservoir."
    end

    redirect_to root_path
  end

  def reset
    @deux_chevaux = DeuxChevaux.first
    @deux_chevaux.update(kilometers: 0, fuel_remaining: @deux_chevaux.tank_capacity)
    redirect_to root_path
  end

  private

  def consommation_pour_100_km
    7.0 # 7 litres pour 100 km
  end
end
