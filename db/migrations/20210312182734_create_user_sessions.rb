Sequel.migration do
  change do
    run 'CREATE EXTENSION "uuid-ossp"'
    create_table(:user_sessions) do
      column :uuid, :uuid, :default => Sequel.function(:uuid_generate_v4), :primary_key => true
      column :user_id, :Bignum, null: false
      column :created_at, 'timestamp(6) without time zone', null: false
      column :updated_at, 'timestamp(6) without time zone', null: false

      index [:user_id], name: :index_user_sessions_on_user_id
      index [:uuid], name: :index_user_sessions_on_uuid
    end
  end
end
