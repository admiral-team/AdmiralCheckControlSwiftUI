//
//  RadioButton.swift
//  AdmiralSwiftUI
//
//  Created on 14.04.2021.
//

import AdmiralTheme
import SwiftUI
/**
 RadioControl - A type of button that lets the user choose between two opposite states, actions, or values. They are applied when there is a list of options from which the user can select only one option.
 You can create a RadioControl by specifying the following parameters in the initializer:
 ## Initializer parameters:
 - text - value of String. Your text will be shown to the right of RadioControl
 - isSelected - Binding<Bool>. Observable property for displaying the selected RadioControl
 - checkState - this parameter is responsible for the display style RadioControl. Can be in two states: normal, error. Default state is a normal
 ## Example to create RadioControl:
 # Code
 ```
 RadioControl(
            isSelected: .constant(true),
            text: "Your name of RadioControl")
 
 ```
*/
@available(iOS 14.0, *)
public struct RadioControl: View {
    
    // MARK: - Public Properties

    /// The selection flag
    @Binding public var isSelected: Bool

    /// The text
    @State public var text: String = ""

    /// The check state
    @State public var checkState: CheckControlState = .normal
    
    // MARK: - Internal Properties
    
    @Environment(\.manager) var manager
    
    // MARK: - Private Properties
    
    @Environment(\.isEnabled) private var isEnabled
    
    private var radioControlValueFormatString = ""

    @ObservedObject private var schemeProvider: SchemeProvider<CheckControlScheme>

    // MARK: - Computed Properites

    private var image: Image {
        return isSelected ? Image(uiImage: Assets.Custom.Control.radioButtonOn.image) : Image(uiImage: Assets.Custom.Control.radioButtonOff.image)
    }
    
    // MARK: - Initializer
    
    public init(
        isSelected: Binding<Bool>,
        text: String = "",
        checkState: CheckControlState = .normal,
        radioControlValueFormatString: String = "",
        schemeProvider: SchemeProvider<CheckControlScheme> = AppThemeSchemeProvider<CheckControlScheme>()
    ) {
        self._isSelected = isSelected
        self._text = .init(initialValue: text)
        self._checkState = .init(initialValue: checkState)
        self.radioControlValueFormatString = radioControlValueFormatString
        self.schemeProvider = schemeProvider
    }

    // MARK: - Body

    public var body: some View {
        let scheme = schemeProvider.scheme
        let tintColor = scheme.tintColor.parameter(for: isEnabled ? .normal : .disabled, state: checkState)
        let textColor = scheme.textColor.parameter(for: isEnabled ? .normal : .disabled)
        HStack {
            image
                .frame(height: 20.0)
                .frame(width: 20.0)
                .foregroundColor(tintColor?.swiftUIColor)
            if !text.isEmpty {
                Text(text)
                    .foregroundColor(textColor?.swiftUIColor)
                    .font(scheme.textFont.swiftUIFont)
            }
        }
        .accessibilityElement()
        .accessibilityValue(String(format: radioControlValueFormatString, isSelected ? "enable" : "disable"))
        .onTapGesture {
            isSelected.toggle()
        }
    }
}
