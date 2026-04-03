require_relative '../lib/hello'
describe "the hello function" do 
    it "says Hello " do
        expect(hello()).to eq("Hello World !")
    end
end