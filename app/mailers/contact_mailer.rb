class ContactMailer < ApplicationMailer

	def new_contact(contact)
		@contact = contact

		mail(to: marcialingoditrust@gmail.com, subject: "Formulario Contact")
end
