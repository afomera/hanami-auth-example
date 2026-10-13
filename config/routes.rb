# frozen_string_literal: true

module Notebook
  class Routes < Hanami::Routes
    # Add your routes here. See https://hanakai.org/learn/hanami/routing/ for details.

    root to: "home.show"
    resources :notes, only: %i[index create destroy]

    resource :session, only: %i[new create destroy]
    resources :passwords, only: %i[new create edit update]
  end
end
