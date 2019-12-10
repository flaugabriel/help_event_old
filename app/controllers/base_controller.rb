# frozen_string_literal: true

class BaseController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_filter :authenticate_user!, except: [:new, :create]
end
