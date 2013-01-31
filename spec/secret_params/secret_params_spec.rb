require 'spec_helper'

describe "SecretParams" do
  let (:params) { {test: "dootdoot"} }
  it "encrypts and decrypts" do
    encrypted = SecretParams.encrypt_params(params)
    decrypted = SecretParams.decrypt_params(encrypted)

    decrypted.should == params
  end
end
