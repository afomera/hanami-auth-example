# frozen_string_literal: true

module Notebook
  module Views
    module Home
      class Show < Notebook::View
        expose :note_count
      end
    end
  end
end
