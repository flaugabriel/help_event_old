# frozen_string_literal: true

class BaseController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
end
