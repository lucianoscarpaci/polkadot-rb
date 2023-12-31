require 'rbnacl'
require 'base58'
require 'bip_mnemonic'

private_key = RbNaCl::PrivateKey.generate
private_key_base58 = Base58.binary_to_base58(private_key.to_bytes)
puts "Private Key: #{private_key_base58}"

entropy = private_key_base58.to_s
mnemonic_words = BipMnemonic.to_mnemonic(mnemonic: entropy)
subkey = "subkey inspect --network polkadot '#{mnemonic_words}'"
system(subkey)
