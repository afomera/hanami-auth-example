# frozen_string_literal: true

module Notebook
  module Relations
    class Users < Notebook::DB::Relation
      schema :users, infer: true do
        associations do
          has_many :sessions
        end
      end
    end
  end
end
