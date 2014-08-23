require "bundler/setup"
Bundler.require(:default, :development)

SPEC_DIR = File.dirname(__FILE__)
TMP_DIR = File.join(SPEC_DIR, "..", "tmp")
FileUtils.mkdir_p(TMP_DIR)
