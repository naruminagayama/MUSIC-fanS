class HomesController < ApplicationController

  skip_before_action :authenticate_customer!

  layout 'home'

  def top
  end

  def about
  end

end
