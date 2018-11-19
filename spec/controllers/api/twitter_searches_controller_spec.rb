describe Api::TwitterSearchesController do
  let(:query) { 'Test query' }
  let(:twitter_gateway) { instance_double(TwitterGateway) }
  let(:twitter_gatewat_response) do
    [
      {
        text: '111'
      },
      {
        text: '222'
      }
    ]
  end

  describe '#create' do
    before do
      allow(TwitterGateway).to receive(:new).and_return(twitter_gateway)
      allow(twitter_gateway).to receive(:search).with(query, count: 5).and_return(twitter_gatewat_response)
    end

    it 'calls twitter api' do
      expect(twitter_gateway).to receive(:search).with(query, count: 5)
      post :create, params: { query: query }
    end

    it 'returns returns success code' do
      post :create, params: { query: query }
      expect(response).to have_http_status(200)
    end
  end
end
