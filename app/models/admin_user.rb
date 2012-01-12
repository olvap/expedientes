class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids,:roles_tokens,:person_id, :people_tokens

  has_and_belongs_to_many :roles, :class_name => "Role",
                          :join_table => :admin_users_roles, :uniq => true

  belongs_to :person


  attr_reader :roles_tokens
  attr_reader :people_tokens

  def people
    [person]
  end

  def people_tokens=(ids)
    self.person_id = ids
  end

  def roles_tokens=(ids)
    self.role_ids = ids.split(",")
  end
end
