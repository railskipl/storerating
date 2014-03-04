class User
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Followable
  include Mongoid::Follower
  include Mongoid::Letsrate
  include Geocoder::Model::Mongoid

  letsrate_rater
  geocoded_by :geoaddress
  after_validation :geocode
  after_save :business_user    #creating businessuser with user id for ratings purpose
                               # Include default devise modules. Others available are:
                               # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:zipcode,:city,:location,:phone_no,:vegetarian,:choose_one,:sex,:business_location_shop,:average_per_month,:photo,
                  :business_name,:business_website,:business_facebook,:business_twitter,:year_round_business ,:business_tel,:business_fax,:business_email,
                  :manager_name,:address,:business_established_in,:family_owned_business,:describe_business,:business_offer_op,:fm_onpremises,
                  :dl_onpremises ,:bdeliver_customer,:business_location,:plan_id,:role_id,:coordinates,:vegan,:user_name

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""
  field :zipcode,            :type => String, :default => ""
  field :city,               :type => String, :default => ""
  field :location,           :type => String, :default => ""
  field :phone_no,           :type => String, :default => ""
  field :vegetarian,         :type => String, :default => ""
  field :sex,                :type => String, :default => ""
  field :choose_one,                :type => String, :default => ""
  field :business_location_shop,                :type => Integer, :default => ""
  field :average_per_month,                     :type => Float, :default => ""
  field :business_name,              :type => String, :default => ""
  field :business_website,              :type => String, :default => ""
  field :business_facebook,              :type => String, :default => ""
  field :business_twitter,              :type => String, :default => ""
  field :year_round_business,              :type => String, :default => ""
  field :business_tel,              :type => String, :default => ""
  field :business_fax,              :type => String, :default => ""
  field :manager_name,              :type => String, :default => ""
  field :address,                   :type => String, :default => ""
  field :business_established_in,              :type => DateTime, :default => ""
  field :family_owned_business,              :type => String, :default => ""
  field :manager_name,              :type => String, :default => ""
  field :describe_business,              :type => String, :default => ""
  field :business_offer_op,              :type =>String, :default => ""
  field :fm_onpremises,              :type => String, :default => ""
  field :dl_onpremises,              :type => String, :default => ""
  field :bdeliver_customer,              :type => String, :default => ""
  field :business_location,              :type => String, :default => ""
  field :role_id,:type => String
  field :coordinates, :type => Array
  field :vegan,              :type => String, :default => ""
  field :user_name,          :type => String, :default => ""
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time
  ## Rememberable
  field :remember_created_at, :type => Time
  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  has_mongoid_attached_file :photo,:styles => { :thumb => "140x100", :medium => "480x270>", :profile => "130x126"}
  validates_presence_of :city,:address
  # Association for user model
  has_many :plans
  has_many :accounts
  has_many :ratings_given, :class_name => 'Rate'
  has_many :reviews
  has_many  :replies
  has_many :massmails
  belongs_to :role
  has_one :business_user ,:dependent => :destroy

  def geoaddress
    [address,city,location].compact.join(', ')
  end

  def business_user
    role = Role.find_by(name: "business")
    if role.id == self.role_id
      b = BusinessUser.find_or_create_by(user_id: self.id)
    end
  end
  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
end