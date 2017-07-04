class User < ApplicationRecord
	validates :name,:surnames, :age,:presence => true
end
