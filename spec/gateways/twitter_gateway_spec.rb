describe TwitterGateway do
  subject { described_class.new }
  let(:twitter_client) { instance_double(Twitter::REST::Client) }

  before { allow(Twitter::REST::Client).to receive(:new).and_return(twitter_client) }

  describe '#search' do
    let(:query) { 'Test query' }
    let(:options) do
      {
        aaa: 'xxx'
      }
    end

    it 'passes query to the search call' do
      expect(twitter_client).to receive(:search).with(query, options)
      subject.search(query, options)
    end

    context 'twitter api raises unauthorized error' do
      before { allow(twitter_client).to receive(:search).with(query, options).and_raise(Twitter::Error::Unauthorized) }

      it 'raises the error' do
        expect { subject.search(query, options) }.to raise_error(Twitter::Error::Unauthorized)
      end
    end
  end
end
