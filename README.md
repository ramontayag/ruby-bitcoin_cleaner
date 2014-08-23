# BitcoinCleaner

Makes development with Bitcoin a little easier. It has helpers that can be used to start, stop, clean the bitcoin daemon. The bitcoin daemon will be run in regtest mode.

This gem been written using Bitcoin Core `0.9.2.1`. BitcoinCleaner takes advantage of the `regtest` option in the new version of Bitcoin Core. Starting `bitcoind -regtest` will create a private network that's a lot faster than the testnet, and easier to manage than a private testnet.

## Usage

1. Make sure that Bitcoin Core is installed in your system and `bitcoind` and `bitcoin-cli` are in your path.
2. Require the library in your `test_helper`/`spec_helper`: `require 'bitcoin_cleaner'`. Now, you have access to `BitcoinCleaner`.
3. In your `test_helper`/`spec_helper` add `BitcoinCleaner.conf_dir = "/path/to/conf/dir"`. This is the folder that contains the bitcoin.conf, and more importantly, the `regtest`. The wallet in `regtest/wallet.dat` will be deleted between runs to make the wallet pristine again. It normally looks like this:

```
~ ❯❯❯ ls ~/.bitcoin
blocks  chainstate  regtest  bitcoin.conf  db.log  debug.log  peers.dat  wallet.dat
```

4. Tell `BitcoinCleaner` when to do its work by adding `bitcoin_cleaner: true` to the metadata.

Sample with RSpec:

```
it "sends bitcoin to the given address", bitcoin_cleaner: true
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
