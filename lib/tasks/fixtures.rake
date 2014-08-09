namespace :fixtures do

  def to_file(model, data)
    File.new("#{Rails.root}/spec/fixtures/#{model}.yml", 'w+')
    File.open("#{Rails.root}/spec/fixtures/#{model}.yml", 'w+') { |f| f.write data.to_yaml }
  end

  def generate_fixture(klass)
    data = klass.all.inject({}) do |hsh, obj|
      identifier = "#{klass.name.underscore}_#{obj.attributes.delete('id')}"

      attrs = obj.attributes.delete_if { |key| key == 'id' }
      new_attrs = {}
      attrs.each do |key, val|
        if key =~ /_id/
          new_attrs[key.gsub(/_id/, '')] = key.gsub(/_id/, "_#{val.to_s}")
        else
          new_attrs[key] = val
        end
      end
      hsh[identifier] = new_attrs
      hsh
    end
    to_file(klass.name.tableize, data)
  end

  task prepare: :environment do

    [User, Account, Item, Order, LineItem].each do |model|
      generate_fixture(model)
    end
  end

end 