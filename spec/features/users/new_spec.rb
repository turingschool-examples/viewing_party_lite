require 'rails_helper'

Rspec.describe 'User Registration Page' do
  before :each do
    visit '/register'
  end

  describe 'the user registration form' do
    it 'show the correct form with fields for name, email, and a submit button' do
      expect(page).to have_content('New User Registration')
      expect(find('form')).to have_content('Name')
      expect(find('form')).to have_content('E-mail')
      expect(find('form')).to have_content('Register')
    end
  end

  describe 'registration submission' do
    context 'if filled out corectly' do
      it 'creates new user' do
        fill_in 'Name', with: 'Kenz'
        fill_in 'E-mail', with: 'kenz_mail@gmail.com'

        expect { click_on 'Register' }.to change { User.count }.by(1)
        user = User.last
        expect(user.name).to eq('Kenz')
        expect(user.email).to eq('kenz_mail@gmail.com')
        # add expect for user page redirection
      end
    end

    context 'if filled out incorrectly, it flashes appropriate error and doesnt create user' do
      it 'with empty fields' do
        expect { click_on 'Register' }.to change { User.count }.by(0)
        expect(page).to have_content("Name invalid: field can't be blank")
        expect(page).to have_content("E-mail invalid: field can't be blank")
        expect(current_path).to eq('/register')
      end

      it 'with non-email string in email field' do
        fill_in 'Name', with: 'Cat'
        fill_in 'E-mail', with: 'What is email'
        expect { click_on 'Register' }.to change { User.count }.by(0)
        expect(page).to have_content('E-mail invalid: not an email address')
        expect(current_path).to eq('/register')
      end

      it 'given a duplicate E-mail' do
        User.create!(name: 'Astrid', email: 'Astrid-mail@gmail.com')
        fill_in 'Name', with: 'Astrid_2'
        fill_in 'E-mail', with: 'Astrid-mail@gmail.com'

        expect { click_on 'Register' }.to change { User.count }.by(0)
        expect(page).to have_content('E-mail invalid: already in use')
        expect(current_path).to eq('/register')
      end
    end
  end
end
