# encoding: utf-8

class ExcelReportUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  def extension_white_list
    %w(xls xlsx)
  end

  # def filename
  #   "something.jpg" if original_filename
  # end
end