# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w[ckeditor/config.js]
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
Rails.application.config.assets.precompile += %w( ckeditor/filebrowser/thumbs/pdf.gif )
Rails.application.config.assets.precompile += %w( ckeditor/filebrowser/thumbs/zip.gif )
Rails.application.config.assets.precompile += %w(ckeditor/filebrowser/thumbs/doc.gif )
Rails.application.config.assets.precompile += %w(ckeditor/filebrowser/thumbs/docx.gif )
Rails.application.config.assets.precompile += %w(ckeditor/filebrowser/thumbs/xls.gif )
Rails.application.config.assets.precompile += %w(ckeditor/filebrowser/thumbs/xlsx.gif )
Rails.application.config.assets.precompile += %w(ckeditor/filebrowser/thumbs/od.gift)
Rails.application.config.assets.precompile += %w(ckeditor/filebrowser/thumbs/od.gifs)
Rails.application.config.assets.precompile += %w(ckeditor/filebrowser/thumbs/rar .gif )
Rails.application.config.assets.precompile += %w(ckeditor/filebrowser/thumbs/tar.gif )
Rails.application.config.assets.precompile += %w(ckeditor/filebrowser/thumbs/tar.gz.gif )
Rails.application.config.assets.precompile += %w(ckeditor/filebrowser/thumbs/swf.gif )
Rails.application.config.assets.precompile += %w( ckeditor/filebrowser/thumbs/unknown.gif )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
