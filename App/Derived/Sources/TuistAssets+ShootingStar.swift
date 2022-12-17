// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum ShootingStarAsset {
  public enum Assets {
    public static let accentColor = ShootingStarColors(name: "AccentColor")
    public static let image1 = ShootingStarImages(name: "image1")
    public static let image10 = ShootingStarImages(name: "image10")
    public static let image11 = ShootingStarImages(name: "image11")
    public static let image12 = ShootingStarImages(name: "image12")
    public static let image13 = ShootingStarImages(name: "image13")
    public static let image21 = ShootingStarImages(name: "image2.1")
    public static let image2 = ShootingStarImages(name: "image2")
    public static let image31 = ShootingStarImages(name: "image3.1")
    public static let image32 = ShootingStarImages(name: "image3.2")
    public static let image3 = ShootingStarImages(name: "image3")
    public static let image41 = ShootingStarImages(name: "image4.1")
    public static let image4 = ShootingStarImages(name: "image4")
    public static let image51 = ShootingStarImages(name: "image5.1")
    public static let image5 = ShootingStarImages(name: "image5")
    public static let image61 = ShootingStarImages(name: "image6.1")
    public static let image62 = ShootingStarImages(name: "image6.2")
    public static let image6 = ShootingStarImages(name: "image6")
    public static let image71 = ShootingStarImages(name: "image7.1")
    public static let image7 = ShootingStarImages(name: "image7")
    public static let image8 = ShootingStarImages(name: "image8")
    public static let image9 = ShootingStarImages(name: "image9")
  }
  public enum Colors {
    public static let black = ShootingStarColors(name: "Black")
    public static let darkGary = ShootingStarColors(name: "DarkGary")
    public static let error = ShootingStarColors(name: "ERROR")
    public static let lightBlack = ShootingStarColors(name: "LightBlack")
    public static let lightGary = ShootingStarColors(name: "LightGary")
    public static let main = ShootingStarColors(name: "Main")
  }
  public enum Image {
    public static let shottingStar = ShootingStarImages(name: "ShottingStar")
    public static let star = ShootingStarImages(name: "Star")
    public static let user1 = ShootingStarImages(name: "user1")
    public static let user2 = ShootingStarImages(name: "user2")
    public static let user3 = ShootingStarImages(name: "user3")
    public static let user4 = ShootingStarImages(name: "user4")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class ShootingStarColors {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension ShootingStarColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ShootingStarColors) {
    let bundle = ShootingStarResources.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
public extension SwiftUI.Color {
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  init(asset: ShootingStarColors) {
    let bundle = ShootingStarResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct ShootingStarImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = ShootingStarResources.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension ShootingStarImages.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ShootingStarImages.image property")
  convenience init?(asset: ShootingStarImages) {
    #if os(iOS) || os(tvOS)
    let bundle = ShootingStarResources.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: ShootingStarImages) {
    let bundle = ShootingStarResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ShootingStarImages, label: Text) {
    let bundle = ShootingStarResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ShootingStarImages) {
    let bundle = ShootingStarResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
