class FolioUploader < CarrierWave::Uploader::Base

  # Kind of storage to use for this uploader:
  storage :file

  # Where uploaded files will be stored.
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # White list of extensions which are allowed to be uploaded.
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
