class Project < ActiveRecord::Base
  has_many :tickets, :dependent => :delete_all # :nullify, :destroy, :delete_all

  validates :name, :presence => true
end
