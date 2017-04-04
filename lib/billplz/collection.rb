module Billplz
  class Collection < Model
    self.api_url = "#{Billplz.configuration.api_url}/api/v3/collections"

    def create
      requires!(@payload, :title)
      request(:post, @payload)
    end
  end
end
