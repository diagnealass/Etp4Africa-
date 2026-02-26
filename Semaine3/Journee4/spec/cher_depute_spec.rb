require_relative '../lib/cher_depute'

describe "The cher_depute method" do
  let(:result) { cher_depute }

  it "should return an array of hashes with correct keys" do
    expect(result).to be_an(Array)
    expect(result.first).to have_key("first_name")
    expect(result.first).to have_key("last_name")
    expect(result.first).to have_key("email")
  end

 it "doit avoir au moins un format d'email valide dans les résultats" do
  # On cherche n'importe quel hash qui contient un @ dans la valeur de la clé "email"
  valid_email_found = result.any? { |h| h["email"].include?("@") }
  expect(valid_email_found).to be true
 end
end 