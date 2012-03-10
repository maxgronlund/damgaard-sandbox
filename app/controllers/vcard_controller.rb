require 'vpim/vcard'

class VcardController < ApplicationController
  

  
  def view
  	#@user = Employee.find_by_id(params[:id])

  	card = Vpim::Vcard::Maker.make2 do |maker|

  		maker.add_name do |name|
      			name.prefix = ''
      			name.given = 'John'
      			name.family = 'Doe'
  		end

  		maker.add_addr do |addr|
      			addr.preferred = true
      			addr.location = 'work'
      			addr.street = '243 Felixstowe Road'
      			addr.locality = 'Ipswich'
      			addr.country = 'United Kingdom'
  		end

  		maker.add_tel('27 26 85 03')

  		maker.add_email('max@synthmax.dk') { |e| e.location = 'work' }

  	end

  	send_data card.to_s, :filename => "contact.vcf"
  end
  
end
