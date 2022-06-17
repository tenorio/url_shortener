class AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)

    if @address.save
      redirect_to root_path
    end
  end

  private

  def address_params
    params.require(:address).permit(:url)
  end
end
