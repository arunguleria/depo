class HomeController < ApplicationController
  
  include CurrentCart
  
  before_action :set_cart

  def welcome    
  end

end
