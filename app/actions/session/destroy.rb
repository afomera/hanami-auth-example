# frozen_string_literal: true

module Notebook
  module Actions
    module Session
      class Destroy < Notebook::Action
        def handle(request, response)
          terminate_session(request)
          response.flash[:notice] = "Signed out."
          response.redirect_to routes.path(:new_session), status: 303
        end
      end
    end
  end
end
