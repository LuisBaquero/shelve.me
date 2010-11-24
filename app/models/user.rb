class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
   validates_presence_of :username, :email, :password
   validates_uniqueness_of :username
   validate :validar_username 
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :reviews
  has_and_belongs_to_many :books  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  def validar_username
  errors.add(:username, "No puede estar en blanco") if :username.blank?
  end 
  
  def has_read?(book)
  	self.books.exists? book
  end
  
  def read(book)
  	self.books << book
  end
  
  def forget(book)
  	book.readers.delete self
  end
 
end
