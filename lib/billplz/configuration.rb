module Billplz
  class Configuration
    attr_accessor :api_key, :http_timeout, :mode, :api_url

    def initialize(options={})
      @http_timeout = 30
      @mode         = 'live'
    end

    def options
      hash = Hash.new
      %w[api_key http_timeout mode].map{|key| hash[key.to_sym] = send(key) }
      binding.pry
      hash
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(args)
    @configuration ||= Configuration.new
    args.each do |arg|
      @configuration.send("#{arg.first}=", arg.last)
    end
  end

  def self.options
    @configuration.options
  end

  def self.configure
    yield configuration
  end

  def self.reset
    @configuration = nil
  end
end
