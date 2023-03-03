require 'users_repository'

repo = UserRepository.new 

RSpec.describe UserRepository do 
    
    def reset_tables
        seed_sql = File.read('spec/seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test', password: 'a' })
        connection.exec(seed_sql)
      end

      describe UserRepository do
        before(:each) do 
          reset_tables
        end
       
        describe 'all method' do 
            it 'gets all users ' do 
                result = repo.all
                expect(result.first.id).to eq 1
                expect(result.first.username).to eq 'BobbyBob'
            end 
        end 

        describe 'find method' do 
            it "gets the second user" do 
                result = repo.find(2) 
                expect(result.username).to eq "Trev0r"
                expect(result.email).to eq "travelling_trevor@makers.com"
            end
        end 

        describe 'create method' do 
            it "create a new user" do 
                user = User.new 
                user.username = 'NewGuy'
                user.email = 'newmail@makers.com'
                repo.create(user)

                result= repo.all
                expect(result.last.username).to eq 'NewGuy'
                expect(result.last.email).to eq 'newmail@makers.com'
            end
        end 

        describe 'delete method' do 
            it 'deletes the first element' do
                repo.delete(1)
                result = repo.all
                expect(result.length).to eq 1 
            end 
        end 

        describe 'update method' do
            it 'makes ammendments to elements' do 
                user_account = repo.find(2)
                
                user_account.username = 'BOB123'
                repo.update(user_account)
                
                user = repo.find(2)
                expect(user.username).to eq 'BOB123'

            end 
        end 



#Code above here for reset
end 
end