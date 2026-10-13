# frozen_string_literal: true

RSpec.describe "Public and protected pages", :db, type: :request do
  let(:user_repo) { Hanami.app["repos.user_repo"] }
  let(:note_repo) { Hanami.app["repos.note_repo"] }
  let(:password) { "correct horse battery staple" }
  let!(:alice) { user_repo.create(email_address: "alice@example.com", password:) }
  let!(:bob) { user_repo.create(email_address: "bob@example.com", password:) }

  it "shows the home page to anyone" do
    get "/"

    expect(last_response.status).to eq 200
    expect(last_response.body).to include "Sign in"
  end

  it "sends signed-out visitors to sign in, then back to where they were going" do
    get "/notes"
    expect(last_response.status).to eq 302
    expect(last_response.location).to eq "/session/new"

    sign_in_as(alice, password:)
    expect(last_response.location).to eq "/notes"
  end

  it "shows only the signed-in user's notes" do
    note_repo.create(user_id: alice.id, title: "Alice's secret")
    note_repo.create(user_id: bob.id, title: "Bob's secret")

    sign_in_as(alice, password:)
    get "/notes"

    expect(last_response.status).to eq 200
    expect(last_response.body).to include "Alice&#39;s secret"
    expect(last_response.body).not_to include "Bob"
  end

  it "creates notes, and rejects a note without a title" do
    sign_in_as(alice, password:)

    post "/notes", note: {title: "Groceries", body: "Eggs"}
    expect(last_response.status).to eq 303

    post "/notes", note: {title: "", body: "No title"}
    expect(last_response.status).to eq 422
    expect(note_repo.for_user(alice.id).map(&:title)).to eq ["Groceries"]
  end

  it "won't delete another user's note" do
    bobs = note_repo.create(user_id: bob.id, title: "Bob's")

    sign_in_as(alice, password:)
    delete "/notes/#{bobs.id}"

    expect(note_repo.for_user(bob.id).map(&:id)).to eq [bobs.id]
  end
end
