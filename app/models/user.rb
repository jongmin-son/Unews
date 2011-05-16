class User < ActiveRecord::Base
has_many :comments
acts_as_authentic
attr_accessor :password_confirmation
attr_accessible :password_confirmation,:password,:persistence_token,:name,:email,:user_photo
has_attached_file :user_photo,
		  :styles => { :thumb => "50x50#"},
			  	:url => "/user_photo/:id/:style/:basename.:extension",
				:path =>":rails_root/public/photos/user_photo/:id/:style.:extension",
        :default_url=>'/images/nobody.png'
validates_presence_of :name, :email, :password
validates_format_of :email, :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
end
