class Book < ActiveRecord::Base
  attr_accessible :title, :author,:description, :cover
  before_validation :validarAutor, :validarTitulo
  validates_presence_of :title, :author
  validates_uniqueness_of :title,:case_sensitive => false, :scope => :author, :message=> "Oops, we already know about that book, thanks anyway!"  
  has_many :reviews 
  has_and_belongs_to_many :users 
  #has_atached_file :cover
  
  def validarAutor 
	  if self.author.blank?
	  	return 
	  else
		  arreglo = self.author.split(" ")
		  c=""
		  arreglo.each{|t| c << t.capitalize+" "}
		  d = c.slice(0,c.size-1)
		  self.author = d
	  end
  end

  def validarTitulo
	  if self.title.blank?
	  	return 
	  else
		  arreglo= self.title.split(" ")
		  c=""
		  arreglo.each{|t| c << t.capitalize+" "}
		  d = c.slice(0,c.size-1)
		  self.title = d
	  end
  end
  
  def self.search(search)
	  if search
		find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
	  else
		find(:all)
	  end
  end  

end
