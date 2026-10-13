# frozen_string_literal: true

module Notebook
  module Actions
    module Passwords
      class New < Notebook::Action
        allow_unauthenticated_access

        def handle(request, response)
        end
      end
    end
  end
end
