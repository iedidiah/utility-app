FactoryGirl.define do
    factory :user do
          name "John Doe"
          email "administrator@example.com"
          password "helloworld"
          password_confirmation "helloworld"
          confirmed_at Time.now
    end
end
