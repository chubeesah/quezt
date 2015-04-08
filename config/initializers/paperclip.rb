Paperclip::Attachment.default_options[:url] = (':s3_domain_url').to_s
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'