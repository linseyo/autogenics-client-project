class User < ApplicationRecord
  has_secure_password
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  belongs_to :role
  has_many :experiments_posted, class_name: "Experiment", foreign_key: :author_id
  has_and_belongs_to_many :experiments_joined, class_name: "Experiment", join_table: "experiments_staff", foreign_key: "staff_id", association_foreign_key: "experiment_id"

  def clearance_levels
    role.name
  end

  def access_token=(given_token)
    if given_token == ENV['FACULTY_ACCESS_TOKEN']
      self.role = Role.find_by(name: "Faculty")
    elsif given_token == ENV['STAFF_ACCESS_TOKEN']
      self.role = Role.find_by(name: "Staff")
    else
      errors.add(:access_token, "Invalid access token")
    end
  end

  def access_token

  end
end
