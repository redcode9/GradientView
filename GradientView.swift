import UIKit

@IBDesignable class GradientView: UIView {
  override class var layerClass: AnyClass {
    CAGradientLayer.self
  }
    
  private var gradientLayer: CAGradientLayer {
    layer as! CAGradientLayer
  }
    
  @IBInspectable var startPoint: CGPoint = CGPoint(x: 0.5, y: 0) {
    didSet { setNeedsDisplay() }
  }
    
  @IBInspectable var endPoint: CGPoint = CGPoint(x: 0.5, y: 1) {
    didSet { setNeedsDisplay() }
  }
    
  @IBInspectable var firstColor: UIColor = .clear {
    didSet { setNeedsDisplay() }
  }
    
  @IBInspectable var secondColor: UIColor = .clear {
    didSet { setNeedsDisplay() }
  }
    
  /// When not nil overrides firstColor and secondColor
  var colors: [UIColor]? {
    didSet { setNeedsDisplay() }
  }
    
  var locations: [Double]? {
    didSet { setNeedsDisplay() }
  }
    
  override func layoutSubviews() {
    super.layoutSubviews()
    backgroundColor = .clear
  }
    
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    updateGradientLayer()
  }
    
  private func updateGradientLayer() {
    let colors = self.colors ?? [firstColor, secondColor]
    gradientLayer.colors = colors.map { $0.cgColor }
    gradientLayer.startPoint = startPoint
    gradientLayer.endPoint = endPoint
    guard let locations = locations else { return }
    gradientLayer.locations = locations.map { NSNumber(value: $0) }
  }
}