require 'posts_repository'
repo = PostsRepository.new
RSpec.describe PostsRepository do 

    def reset_tables
        seed_sql = File.read('spec/seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test', password: 'a' })
        connection.exec(seed_sql)
      end

      describe PostsRepository do
        before(:each) do 
          reset_tables
        end

        describe 'all method' do 
            it 'gets all posts' do 
                result = repo.all
                expect(result.first.id).to eq 1
                expect(result.first.title).to eq 'Hello Worldd'
                expect(result.first.content).to eq 'Today I started my coding journey!'
                expect(result.first.user_id).to eq 1
            end 
        end 

        describe 'find method' do 
            it "gets the second post" do 
                result = repo.find(2) 
                expect(result.title).to eq "Trevors Travels"
                expect(result.content).to eq "Stay tuned for updates on my trip to Kenya"
                expect(result.user_id).to eq 2
            end
        end 

        describe 'create method' do 
            it "create a new user" do 
                post = Posts.new 
                post.title = 'Im in Kenya'
                post.content = 'Landed safely!'
                post.user_id = 2
                repo.create(post)

                result= repo.all
                expect(result.last.title).to eq 'Im in Kenya'
                expect(result.last.content).to eq 'Landed safely!'
                expect(result.last.user_id).to eq 2
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
                post = repo.find(2)
                
                post.user_id = 1
                post.content = 'Trolled by Bob'
                repo.update(post)
                
                post_output = repo.find(2)
                expect(post_output.user_id).to eq 1
                expect(post_output.content).to eq 'Trolled by Bob'
            end 
        end 


    end     
end 
