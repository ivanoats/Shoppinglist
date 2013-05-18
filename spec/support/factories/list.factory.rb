
FactoryGirl.define do
  factory :list do
    name 'Grocery'
    status 'Yes'
    category 'Fred Meyers'
    publicity 't'
    after_build do |list|
      list.items << FactoryGirl.build(:item, :list => list)
    end
  end
end

