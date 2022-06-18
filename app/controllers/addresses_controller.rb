class AddressesController < ApplicationController
  def create
    address_params_sanitized = address_params[:url].gsub(/^(?:https?:\/\/)?/i, '')

    # We don't want repeated URLs in our database
    @address = Address.find_or_initialize_by(url: address_params_sanitized)

    respond_to do |format|
      if @address.new_record?
        if @address.save
          url_saved = true
        end
      else
        url_saved = true
      end

      if url_saved
        format.html { redirect_to root_path, notice: 'URL successfully shortened!' }
        format.js
        format.json { render json: @address, status: :created, location: @address }
      else
        format.html { redirect_to root_path, notice: 'Error shortening URL. Please try again.' }
      end
    end
  end

  def redirect
    if params[:path]
      url_id = Address.bijective_decode(params[:path])
      url_rec = Address.find(url_id) rescue nil

      if url_rec
        redirect_to "http://#{ url_rec.url }"
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  private

  def address_params
    params.require(:address).permit(:url)
  end
end
