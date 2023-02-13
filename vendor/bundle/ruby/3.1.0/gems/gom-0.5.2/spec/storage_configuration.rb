require File.expand_path(File.join(File.dirname(__FILE__), "..", "lib", "gom"))

GOM::Storage.configure {
  storage {
    name :test_storage
    adapter :fake_adapter
    view {
      name :test_all_view
      kind :all
    }
    view {
      name :test_property_view
      kind :property
      filter {
        model_class :equals, "GOM::Spec::Object"
        number :greater_than, 13
      }
      properties :number
    }
    view {
      name :test_object_class_view
      kind :class
      model_class Object
    }
    view {
      name :test_map_view
      kind :map_reduce
      map_function "function(document) { }"
      reduce_function "function(key, values) { }"
    }
  }
}