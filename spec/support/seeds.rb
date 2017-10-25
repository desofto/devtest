RSpec.configure do |config|
  config.before(:suite) do
    Seeds.generate
  end
end
