# frozen_string_literal: true

module Notebook
  module Actions
    module Notes
      # Protected: Notebook::Action requires a signed-in user unless an action opts out.
      class Index < Notebook::Action
        include Deps["repos.note_repo"]

        def handle(request, response)
          response[:notes] = note_repo.for_user(current_user(request).id)
        end
      end
    end
  end
end
