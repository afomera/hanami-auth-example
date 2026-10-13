# frozen_string_literal: true

module Notebook
  module Relations
    class Sessions < Notebook::DB::Relation
      schema :sessions, infer: true do
        associations do
          belongs_to :user
        end
      end
    end
  end
end
