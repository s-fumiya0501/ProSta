
shared_examples_for "a read-only adapter connected to a stateless storage" do

  before :all do
    GOM::Storage.setup
  end

  after :all do
    GOM::Storage.teardown
  end

  describe "fetching an object" do

    it "should return the correct object" do
      object = GOM::Storage.fetch "test_storage:object_1"
      object.should be_instance_of(GOM::Spec::Object)
      object.number.should == 5
      GOM::Object.id(object).should == "test_storage:object_1"
    end

    it "should return the exactly the same object if fetched again" do
      object_one = GOM::Storage.fetch "test_storage:object_1"
      object_two = GOM::Storage.fetch "test_storage:object_1"
      object_one.should === object_two
    end

    it "should return proxy objects that fetches the related objects" do
      object = GOM::Storage.fetch "test_storage:object_1"
      related_object = object.related_object
      related_object.should be_instance_of(GOM::Object::Proxy)
      related_object.object.number.should == 7
    end

  end

  describe "storing an object" do

    it "should raise a ReadOnlyError" do
      lambda do
        GOM::Storage.store Object.new, "test_storage"
      end.should raise_error(GOM::Storage::ReadOnlyError)
    end

  end

  describe "removing an object" do

    before :each do
      @object = GOM::Storage.fetch "test_storage:object_1"
    end

    it "should raise a ReadOnlyError" do
      lambda do
        GOM::Storage.remove @object
      end.should raise_error(GOM::Storage::ReadOnlyError)
    end

  end

  describe "counting the objects" do

    it "should return a number" do
      count = GOM::Storage.count :test_storage
      count.should be_instance_of(Fixnum)
    end

  end

  describe "fetching an all collection" do

    it "should return a collection" do
      collection = GOM::Storage.collection :test_storage, :test_all_view
      collection.should be_instance_of(GOM::Object::Collection)
    end

    it "should return a collection that contains all objects of the database" do
      collection = GOM::Storage.collection :test_storage, :test_all_view
      collection.size.should == 2
    end

  end

  describe "fetching a class collection" do

    it "should return a collection" do
      collection = GOM::Storage.collection :test_storage, :test_object_class_view
      collection.should be_instance_of(GOM::Object::Collection)
    end

    it "should return a collection that contains all object of class Object" do
      collection = GOM::Storage.collection :test_storage, :test_object_class_view
      collection.size.should > 0
      collection.each do |object|
        [ 5, 7 ].should include(object.number)
      end
    end

  end

end
