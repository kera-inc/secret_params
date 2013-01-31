# SecretParams

## Installation

Add an initializer (```secret_params.rb```) to set a secret key
```ruby
SecretParams::SecretToken = "secret"
```

Add this line to your application's Gemfile:

    gem 'secret_params'

## Usage

Where you would normally do a request like so: 

```ruby
get 'users.html', user_id: 22
```
Now you wrap the parameters like so:
```ruby
get 'users.html', SecretParams.encrypt_params(user_id: 22)
```

On the receiving side in the controller:

```ruby
before_filter :decrypt_params

def decrypt_params
	params.merge!(SecretParams.decrypt_params(params))
end
```

