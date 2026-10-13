# frozen_string_literal: true

module Notebook
  module Actions
    module Notes
      class Create < Notebook::Action
        include Deps["repos.note_repo", view: "views.notes.index"]

        params do
          required(:note).hash do
            required(:title).filled(:string, max_size?: 200)
            optional(:body).maybe(:string)
          end
        end

        def handle(request, response)
          user = current_user(request)

          if request.params.valid?
            note = request.params[:note]
            note_repo.create(user_id: user.id, title: note[:title], body: note[:body].to_s)

            response.flash[:notice] = "Note saved."
            response.redirect_to routes.path(:notes), status: 303
          end

          response.flash.now[:alert] = "Give your note a title."
          response.status = 422
          response.render(view, notes: note_repo.for_user(user.id))
        end
      end
    end
  end
end
