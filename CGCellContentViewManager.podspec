
Pod::Spec.new do |s|
  s.name         = "CGCellContentViewManager"
  s.version      = "1.0"
  s.summary      = "An elegant way to solve the problem while clicking a UITableViewCell, the subviews in the cell's contentView will change backgroundColor as our unexpected."
  s.description  = "An elegant way to solve the problem while clicking a UITableViewCell, the subviews in the cell's contentView will change backgroundColor as our unexpected."
  s.homepage     = "https://github.com/CoderGin/CGCellContentViewManager"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license = { :type => "MIT", :file => "LICENSE" }
  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.author = { "Coder Gin" => "https://github.com/CoderGin" }
  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.platform = :ios, "7.0"
  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source = { :git => "https://github.com/CoderGin/CGCellContentViewManager.git", :tag => "1.0" }
  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source_files = "CGCellContentViewManager/*.{h,m}"
  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.requires_arc = true
end
