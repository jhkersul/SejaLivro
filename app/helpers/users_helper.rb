module UsersHelper
	
	def full_address
		if @user_addresses.count == 0
			"Endereço não informado"
		else
			@user_addresses.each do |addr|
				if addr.main == true
					return addr.street + " " + addr.city
				end
			end
		end
	end

	
end
