require "secret_params/version"
require 'base64'
require 'ezcrypto'
require 'json'

module SecretParams

  def self.encrypt_params(params)
    { token: encrypted_token(params) }
  end

  def self.encrypted_token(map)
    Base64::urlsafe_encode64(secret_key.encrypt(map.to_json))
  end

  def self.decrypt_params(params)
    return nil unless params[:token]

    begin
      decrypted = secret_key.decrypt(Base64::urlsafe_decode64(params[:token]))
    rescue
      return nil
    end

    # We're expecting symbols on params, but json comes as strings
    JSON.parse(decrypted, symbolize_names: true)
  end

  private

  def self.secret_key
    token = ENV['SECRET_PARAMS_TOKEN'] || "FT4UUzBmnO5OYFqNXfj7SA=="
    EzCrypto::Key.new(token)
  end

end