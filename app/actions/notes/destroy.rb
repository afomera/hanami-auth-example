# frozen_string_literal: true

module Notebook
  module Actions
    module Notes
      class Destroy < Notebook::Action
        include Deps["repos.note_repo"]

        def handle(request, response)
          note_repo.delete(user_id: current_user(request).id, id: request.params[:id].to_i)

          response.flash[:notice] = "Note deleted."
          response.redirect_to routes.path(:notes), status: 303
        end
      end
    end
  end
end
