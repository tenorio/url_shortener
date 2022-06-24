class Top100Controller < ApplicationController
  def index
    @urls = Address.select(:url, :url_shortened, :title, :counter_hit).where('counter_hit > 0')
                   .order('counter_hit DESC, url').limit(100)
  end
end
