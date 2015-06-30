# == Schema Information
#
# Table name: admins
#
#  id                  :integer          not null, primary key
#  email               :string(255)      default(""), not null
#  encrypted_password  :string(255)      default(""), not null
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0), not null
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :inet
#  last_sign_in_ip     :inet
#  failed_attempts     :integer          default(0), not null
#  unlock_token        :string(255)
#  locked_at           :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  first_name          :string(255)      not null
#  last_name           :string(255)      not null
#
# Indexes
#
#  index_admins_on_email         (email) UNIQUE
#  index_admins_on_unlock_token  (unlock_token) UNIQUE
#

class Admin < ActiveRecord::Base
  devise :database_authenticatable, :lockable, :rememberable, :trackable, :validatable

  has_many :tidbits, as: :author

  def name
    "#{first_name} #{last_name}"
  end

  def shy_name
    "#{first_name} #{last_name[0]}."
  end
end
