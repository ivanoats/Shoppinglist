
FactoryGirl.define do
  factory :item do
    name "Cap'n Crunch"
    note 'big box'
    tag 'yummy'
    association :list, :factory => :item
  end
end