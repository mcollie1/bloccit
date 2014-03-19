class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name # <--- comment this line out
  # attr_accessible :title, :body
  has_many :posts
  has_many :comments
  before_create :set_member
  mount_uploader :avatar, AvatarUploader

  def role?(base_role)
    role == base_role.to_s
  end


  private
  def set_member
    self.role = 'member'
  end

  # extra methods due to errors in checkpoint 13
  #   after converting to Rails 4
  #   db:reset undefined method and SQLite3 error
  def email_required?
    false
  end

  def email_changed?
    false
  end
end
