# frozen_string_literal: true

module Notebook
  module Repos
    # Every query is scoped to a user, so one user can never read or delete another's notes.
    class NoteRepo < Notebook::DB::Repo
      def for_user(user_id)
        notes.where(user_id:).order(notes[:created_at].desc, notes[:id].desc).to_a
      end

      def count_for_user(user_id)
        notes.where(user_id:).count
      end

      def create(user_id:, title:, body: "")
        notes.changeset(:create, user_id:, title:, body:).commit
      end

      def delete(user_id:, id:)
        notes.where(user_id:, id:).delete
      end
    end
  end
end
