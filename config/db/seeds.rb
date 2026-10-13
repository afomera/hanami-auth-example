# frozen_string_literal: true

# Seeds a demo account for trying the app: demo@example.com / "notebook demo password"
user_repo = Hanami.app["repos.user_repo"]
note_repo = Hanami.app["repos.note_repo"]

unless user_repo.find_by_email("demo@example.com")
  demo = user_repo.create(email_address: "demo@example.com", password: "notebook demo password")
  note_repo.create(user_id: demo.id, title: "Welcome to Notebook", body: "Only you can see your notes.")
end
