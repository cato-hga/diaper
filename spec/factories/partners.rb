# == Schema Information
#
# Table name: partners
#
#  id                 :integer          not null, primary key
#  distribution_limit :integer
#  email              :string
#  name               :string
#  note               :text
#  send_reminders     :boolean          default(FALSE), not null
#  status             :integer          default("uninvited")
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  organization_id    :integer
#

FactoryBot.define do
  factory :partner do
    sequence(:name) { |n| "Leslie Sue, the #{n}" }
    sequence(:email) { |n| "leslie#{n}@gmail.com" }
    send_reminders { true }
    organization { Organization.try(:first) || create(:organization) }
  end

  trait :approved do
    status { :approved }
  end
end
