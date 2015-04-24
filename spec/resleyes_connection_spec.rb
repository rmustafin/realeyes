require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'RealeyesConnection' do
  let(:connection){ Realeyes::Connection.new({access_key: 'access_key', secret_key: 'secret_key'}) }

  describe '#request_uri' do
    before do
      Timecop.freeze(Time.new(2015, 04, 23))
    end

    after do
      Timecop.return
    end

    it 'should has correct signature' do
      expect(connection.request_uri('get', 'GetStudies').to_s).to include('IovWeV3SBxu0ktiqvl4HhHGq3jM%3D')
    end
  end
end
