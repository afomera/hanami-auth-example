# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :notes do
      primary_key :id
      foreign_key :user_id, :users, null: false, on_delete: :cascade, index: true
      column :title, String, null: false
      column :body, String, text: true, null: false, default: ""
      column :created_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end
