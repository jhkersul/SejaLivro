module UsersHelper
	def full_address
		@user.addresses each do |addr|
			if addr.main == true
				return addr.street + " " + addr.city
			end
		end
	end
end
