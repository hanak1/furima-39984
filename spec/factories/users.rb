FactoryBot.define do
  factory :user do
    nick_name { 'test' }
    email                 { 'test@example' }
    password              { '000000a' }
    password_confirmation { password }
    last_name             { '苗字' }
    first_name            { '名前' }
    japanese_first_name   { 'ナマエ' }
    japanese_last_name    { 'ミョウジ' }
    birth_date            { '1234-1-1' }
  end
end
