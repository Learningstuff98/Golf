class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:lobby]

  def index
  end

  def lobby
  end

end
