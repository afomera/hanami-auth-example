# frozen_string_literal: true

module Notebook
  module Actions
    module Passwords
      class Edit < Notebook::Action
        allow_unauthenticated_access

        include Deps["authentication.password_reset_tokens"]

        def handle(request, response)
          if password_reset_tokens.resolve(request.params[:id])
            response[:token] = request.params[:id]
            return
          end

          response.flash[:alert] = "That password reset link is invalid or has expired."
          response.redirect_to routes.path(:new_password)
        end
      end
    end
  end
end
