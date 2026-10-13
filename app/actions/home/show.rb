# frozen_string_literal: true

module Notebook
  module Actions
    module Home
      # Public: anyone can see the home page.
      class Show < Notebook::Action
        allow_unauthenticated_access

        include Deps["repos.note_repo"]

        def handle(request, response)
          user = current_user(request)
          response[:note_count] = user ? note_repo.count_for_user(user.id) : 0
        end
      end
    end
  end
end
