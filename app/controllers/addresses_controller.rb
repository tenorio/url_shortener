class AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to root_path, notice: 'URL successfully shortened!' }
        format.js
        format.json { render json: @address, status: :created, location: @address }
      end
    end
  end

  private

  def address_params
    params.require(:address).permit(:url)
  end
end
