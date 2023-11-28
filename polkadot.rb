require 'rbnacl'
require 'base58'
require 'bip_mnemonic'

private_key = RbNaCl::PrivateKey.generate
private_key_base58 = Base58.binary_to_base58(private_key.to_bytes)
puts "Private Key: #{private_key_base58}"

# Get the corresponding public key
public_key = private_key.public_key

# Convert public key to Base58 format
public_key_base58 = Base58.binary_to_base58(public_key.to_bytes)
puts "Public Key: #{public_key_base58}"

# get the address
address = public_key.to_bytes[-20..-1]
address_base58 = Base58.binary_to_base58(address, :bitcoin)
puts "Address: #{address_base58}"

# generate mnemonic passphrase
entropy = private_key_base58.to_s
mnemonic_words = BipMnemonic.to_mnemonic(mnemonic: entropy)
words = BipMnemonic.to_seed(mnemonic: mnemonic_words)
puts "Mnemonic: #{mnemonic_words}"