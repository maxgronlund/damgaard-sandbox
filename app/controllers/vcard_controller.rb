require 'vpim/vcard'

class VcardController < ApplicationController
  

  
  def show
  	@contact = ContactPerson.find(params[:id])

  	card = Vpim::Vcard::Maker.make2 do |maker|

  		maker.add_name do |name|
      			name.prefix = ''
      			name.given = @contact.name
#      			name.family = 'Doe'
  		end

  		maker.add_addr do |addr|
      			addr.preferred = true
      			addr.location = 'Damgard'
      			addr.street = 'Birkegaardsvej 26'
      			addr.locality = '8361 Hasselager'
      			addr.country = 'Danmark'
  		end

  		maker.add_tel(@contact.tlf) 
  		maker.add_email(@contact.email) { |e| e.location = 'work' }
  		maker.add_tel('http:damgaard-sandbox.com') 
  		maker.add_note(@contact.title)

  	end

  	send_data card.to_s, :filename => "contact.vcf"
  end
  
end
