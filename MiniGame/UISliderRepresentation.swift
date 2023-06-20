//
//  SliderView.swift
//  MiniGame
//
//  Created by Юлия Ястребова on 20.06.2023.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    @Binding var value: Double
    
    let alpha: Int
    let color: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.tintColor = .systemBlue
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueHasChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $value)
    }
}

extension UISliderRepresentation {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(currentValue: Binding<Double>) {
            self._value = currentValue
        }
        
        @objc func valueHasChanged(_ sender: UISlider) {
            value = Double(sender.value )
        }
    }
}

struct SUISliderRepresentation_Previews: PreviewProvider {
    static var previews: some View {
        UISliderRepresentation(value: .constant(50), alpha: 50, color: .red)
    }
}
