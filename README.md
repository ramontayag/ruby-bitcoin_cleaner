# BitcoinTestnet

Makes development with Bitcoin a little easier. It has helpers that can be used to start, stop, clean the testnet.

## Usage

First, require the library in your  `test_helper`/`spec_helper`:

    require 'bitcoin_testnet'

Now, you have access to `BitcoinTestnet`.

Second, you have to tell BitcoinTestnet where the testnet in a box directory is. I prefer to keep it in the test folder of my project. For example, with RSpec:

    git submodule add https://github.com/freewil/bitcoin-testnet-box testnet

Then, in your `test_helper`/`spec_helper`:

    BitcoinTestnet.dir = "spec/testnet"

Third, tell `BitcoinTestnet` when to do its work:

- Before the test suite starts, call `BitcoinTestnet.start`. This will start the Testnet and clean it. If you have already started the Testnet yourself manually, it will just clean it.
- Before each spec, call `BitcoinTestnet.clean`. This will reset the Testnet, so it looks like it did the first time you started the Testnet.
- After the test suite is finished, call `BitcoinTestnet.stop`. This turns off the Testnet and cleans if. If you started the Testnet manually, then it just cleans it.

Sample with RSpec:

    RSpec.configure do |config|
      config.before(:suite) { BitcoinTestnet.start }
      config.before(:each) { BitcoinTestnet.clean }
      config.after(:suite) { BitcoinTestnet.stop }
    end


**Tip**: If you'll just use the above, you can configure it automatically by calling `BitcoinTestnet.configure_rspec!`.

## TL;DR

    require 'bitcoin_testnet'

    BitcoinTestnet.dir = "path/to/testnet"
    BitcoinTestnet.configure_rspec!

## Installation

Add this line to your application's Gemfile:

    gem 'bitcoin_testnet'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitcoin_testnet

## Tip

To make integration tests faster, use something like [VCR](https://github.com/vcr/vcr) to record the communication between your project and the Testnet.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
