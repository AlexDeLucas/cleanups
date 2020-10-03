FactoryBot.define do
    factory :cleanup do
      date { '07/13/20' }
      location { 'Miami Beach, FL' }
      volunteer_num { 3 }
      trash_pounds { 7 }
      description {
        'Most common item was plastic bottles.'
      }
  
      association :user, factory: :user
    end
  end