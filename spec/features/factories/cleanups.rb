FactoryBot.define do
    factory :cleanup do
      title { 'Lake Champlain Cleanup Social' }
      posted_by { 'Mary Bennett' }
      date { '2020-07-13' }
      state { 'NY' }
      city { 'Essex' }
      cleanup_type { 'Coastal' }
      volunteers { 4 }
      total_trash { 9 }
      description {
        'Most common item was plastic bottles.'
      }
  
      association :user, factory: :user
    end
  end