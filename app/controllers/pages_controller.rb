class PagesController < ApplicationController

  skip_before_filter :authenticate

  def home

  end

  def about_us
  end

  def thank_you

  end

  def sign_up
      @user = User.new
  end

  def client_sign_up
    @client = Client.new
  end

end
