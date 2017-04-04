module Billplz
  class Collection < Model
    self.api_url = "https://billplz-staging.herokuapp.com/api/v3/collections"

    def create
      requires!(@payload, :title)
      request(:post, @payload)
    end
  end
end
