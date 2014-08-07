# BitcoinCleaner

Makes development with Bitcoin a little easier. It has helpers that can be used to start, stop, clean the bitcoin daemon. The bitcoin daemon will be run in regtest mode.

## Usage

First, require the library in your  `test_helper`/`spec_helper`:

    require 'bitcoin_cleaner'

Now, you have access to `BitcoinCleaner`.

Then, in your `test_helper`/`spec_helper`:

    BitcoinCleaner.dir = "/path/to/bitcoin/bin/files" # where you can find bitcoind and bitcoin-cli

Third, tell `BitcoinCleaner` when to do its work:

- Before each spec, call `BitcoinCleaner.start`. This will start and clean the Bitcoin daemon private network, so it looks like it did the first time you started the daemon.
- After the test suite is finished, call `BitcoinCleaner.stop`. This turns off the daemon.

Sample with RSpec:

```
RSpec.configure do |config|
  config.before(:each) { BitcoinCleaner.start }
  config.after(:suite) { BitcoinCleaner.stop }
end
```

### RSpec and VCR

Cleaning the daemon every time is slow. If you have VCR, you can make this a lot faster by calling `BitcoinCleaner.configure_with_rspec_and_vcr!` in your spec helper. With this, you won't need to call `BitcoinCleaner#start` and `BitcoinCleaner#stop`.

## Tip

To make integration tests faster, use something like [VCR](https://github.com/vcr/vcr) to record the communication between your project and the daemon.

## Contributing

I suggest you do your development in this [Vagrant box](https://github.com/ramontayag/ruby-bitcoin-box). I use it for my development.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

If you find this useful, consider sharing some BTC love: `1PwQWijmJ39hWXk9X3CdAhEdExdkANEAPk`
