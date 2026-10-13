# frozen_string_literal: true

require "hanami"
require "hanami/turbo"

module Notebook
  class App < Hanami::App
    config.actions.sessions = :cookie, {
      key: "notebook.session",
      secret: settings.session_secret,
      expire_after: 60 * 60 * 24 * 30, # 30 days
      same_site: "Lax",
      httponly: true,
      secure: Hanami.env?(:production)
    }

    Hanami::Turbo.install(config)
  end
end
