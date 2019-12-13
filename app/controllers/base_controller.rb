# frozen_string_literal: true

class BaseController < ApplicationController
  protect_from_forgery with: :null_session
  include DeviseTokenAuth::Concerns::SetUserByToken

end
