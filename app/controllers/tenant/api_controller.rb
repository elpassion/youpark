module Tenant
  class ApiController < ActionController::Base
    include CustomerConcern
    protect_from_forgery with: :null_session
  end
end