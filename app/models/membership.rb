class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates :client, uniqueness: {scope: :gym, message: "is already a member"}
  # validates :client_id, uniqueness: {scope: :gym_id} 

end

# TEST in console
# Client.first.gyms.pluck(:id)
# m = Membership.create(client: Client.first, gym: Client.first.gyms.sample, charge: 100)
# m.errors.messages

#OR
# Membership.create!(client: Client.first, gym: Client.first.gyms.sample, charge: 100)
