Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id, type: :Bignum
      column :name, 'character varying', null: false
      column :email, 'character varying', null: false
      column :password_digest, 'character varying', null: false
      column :created_at, 'timestamp(6) without time zone', null: false
      column :updated_at, 'timestamp(6) without time zone', null: false

      index [:email], name: :index_users_on_email, unique: true
    end
  end
end