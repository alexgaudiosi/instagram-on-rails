FactoryGirl.define do
	factory :alex, class: 'User' do
		email 'alex@example.com'
		password '12345678'
		password_confirmation '12345678'
	end

	factory :sarah, class: 'User' do
		email 'sarah@example.com'
		password '12345678'
		password_confirmation '12345678'
	end

end