require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe ItunesConnect::Commands do

  describe 'all' do
    it 'should return all available command' do
      ItunesConnect::Commands.all.should == [
                                        ItunesConnect::Commands::Download,
                                        ItunesConnect::Commands::Import,
                                        ItunesConnect::Commands::Report,
                                        ItunesConnect::Commands::Help
                                       ]
    end
  end

  describe 'for_name' do
    before(:each) do
      @clip = mock(:clip)
      @clip.stub!(:opt).and_return(nil)
      @clip.stub!(:req).and_return(nil)
      @clip.stub!(:flag).and_return(nil)
    end

    it 'should return Download for download' do
      ItunesConnect::Commands.for_name('download', @clip).
        should be_kind_of(ItunesConnect::Commands::Download)
    end

    it 'should return Import for import' do
      ItunesConnect::Commands.for_name('import', @clip).
        should be_kind_of(ItunesConnect::Commands::Import)
    end

    it 'should return Report for report' do
      ItunesConnect::Commands.for_name('report', @clip).
        should be_kind_of(ItunesConnect::Commands::Report)
    end

    it 'should return Help for help' do
      ItunesConnect::Commands.for_name('help', @clip).
        should be_kind_of(ItunesConnect::Commands::Help)
    end


    it 'should return nil for other names' do
      ItunesConnect::Commands.for_name('foobar', @clip).should be_nil
    end
  end
end

