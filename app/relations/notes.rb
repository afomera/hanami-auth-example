# frozen_string_literal: true

module Notebook
  module Relations
    class Notes < Notebook::DB::Relation
      schema :notes, infer: true do
        associations do
          belongs_to :user
        end
      end
    end
  end
end
