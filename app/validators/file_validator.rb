class FileValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    if value #we do something only if a file is attached
      if value.respond_to? :path #check if is a file
        unless options[:ext].include? File.extname(value.path).delete('.').to_sym
          record.errors[attribute] << "is not a valid file #{options[:ext].join(',')}"
        end
      else
        record.errors[attribute] << "is not a valid file "
      end
    end
  end

end