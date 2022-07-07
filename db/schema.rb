# frozen_string_literal: true

# Shut up rubocop
ActiveRecord::Schema.define(version: 20_220_705_235_037) do
  enable_extension 'plpgsql'

  create_table 'parties', force: :cascade do |t|
    t.integer 'movie_id'
    t.time 'duration'
    t.date 'date'
    t.time 'start_time'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_parties_on_user_id'
  end
  create_table 'party_users', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'party_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['party_id'], name: 'index_party_users_on_party_id'
    t.index ['user_id'], name: 'index_party_users_on_user_id'
  end
  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
  add_foreign_key 'parties', 'users'
  add_foreign_key 'party_users', 'parties'
  add_foreign_key 'party_users', 'users'
end
