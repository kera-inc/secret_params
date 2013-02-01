# SecretParams

## Installation

Add this line to your application's Gemfile:

    gem 'secret_params', git: "git@github.com:kera-inc/secret_params.git"

Log into the console and generate a secret key

```
> EzCrypto::Key.generate
=> "SecretKey"
``` 

Set the ```SECRET_PARAMS_TOKEN``` environment variable to the generated key.

Install the gem on any machine you need to communicate securely with and use the same generated key.

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

