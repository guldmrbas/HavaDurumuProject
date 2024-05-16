//
//  LoadingView.swift
//  WeatherProject
//
//  Created by Gülsüm Demirbaş on 15.05.2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity , maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
