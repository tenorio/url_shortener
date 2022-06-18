class Top100Controller < ApplicationController
  def index
      @urls = Address.select(:url, :counter_hit).where('counter_hit > 0').order('counter_hit DESC').limit(100)
  end
end
